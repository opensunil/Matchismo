//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Sunil Varghese on 11/25/13.
//  Copyright (c) 2013 Sunil Varghese. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchType;
@property (weak, nonatomic) IBOutlet UILabel *lastPlayComment;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if (!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    if (!self.game.started) {
        self.game.started = YES;
        [self.matchType setEnabled:NO];
    }
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    if (self.game.results.matched) {
        if (!self.game.results.penalty){
            self.lastPlayComment.text = [NSString stringWithFormat:@"Matched %@ for %d points", [self cardList:self.game.results.getMatches], self.game.results.scoreChange];
        }else{
            self.lastPlayComment.text = [NSString stringWithFormat:@"%@ don't match! %d point penalty!", [self cardList:self.game.results.getFailedMatches], self.game.results.scoreChange];
        }
    }else{
        self.lastPlayComment.text = self.game.results.card.contents;
    }
    [self updateUI];
}

- (IBAction)resetGameButton {
    self.game = nil;
    self.game = self.game;
    self.scoreLabel.text = @"Score: 0";
    self.lastPlayComment.text = @"";
    [self updateUI];
    [self.matchType setEnabled:YES];
    self.game.matchType = self.matchType.selectedSegmentIndex + 2;
}

- (IBAction)matchTypeSegmentControl:(UISegmentedControl *)sender {
    self.game.matchType = sender.selectedSegmentIndex + 2;
    NSLog(@"Selected segment: %d", self.game.matchType); // 2-match:0, 3-match:1
}

- (NSString *)cardList:(NSArray *)cards{
    NSString *result = @"";
    
    for (int i=0; i<[cards count]; i++){
        result = [NSString stringWithFormat:@"%@%@", result, ((Card *)cards[i]).contents];
    }
    
    return result;
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.results.score];
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
