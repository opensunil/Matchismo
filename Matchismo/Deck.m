//
//  Deck.m
//  Matchismo
//
//  Created by Sunil Varghese on 12/2/13.
//  Copyright (c) 2013 Sunil Varghese. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if ([self.cards count] > 0){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
