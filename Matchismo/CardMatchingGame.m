//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sunil Varghese on 1/8/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) MatchingCardResults *results;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame
@synthesize matchType = _matchType;

- (NSUInteger)matchType{
    if (!_matchType || _matchType==0){
        _matchType = 2;
    }
    return _matchType;
}

- (void)setMatchType:(NSUInteger)matchType{
    if (matchType >= 2){
        _matchType = matchType;
    }
}

- (MatchingCardResults *)results{
    if (!_results){
        _results = [[MatchingCardResults alloc] init];
    }
    return _results;
}

- (NSMutableArray *)cards{
    if (!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self){
        for (int i=0; i<count;i++){
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
        self.started = NO;
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    self.results.card = card;
    self.results.matched = NO;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            // match against another card
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init]; //of type Card
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    [chosenCards addObject:otherCard];
                    if (chosenCards.count == (self.matchType-1)){
                        self.results.matched = YES;
                        // do n-match
                        int matchScore = [card match:chosenCards];
                        if (matchScore){
                            self.results.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            [self.results setMatchCard:card withChosenCards:chosenCards];
                            self.results.penalty = NO;
                            self.results.scoreChange = matchScore * MATCH_BONUS;
                            for (Card *matchCard in chosenCards){
                                matchCard.matched = YES;
                            }
                        }else{
                            self.results.score -= MISMATCH_PENALTY;
                            [self.results setFailedMatchCard:card withChosenCards:chosenCards];
                            self.results.penalty = YES;
                            for (Card *unchooseCard in chosenCards){
                                unchooseCard.chosen = NO;
                            }
                        }
                        break;
                    }
                }
            }
            self.results.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


@end
