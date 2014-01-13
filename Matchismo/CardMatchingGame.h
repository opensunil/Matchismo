//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sunil Varghese on 1/8/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "MatchingCardResults.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) MatchingCardResults *results;
@property (nonatomic) NSUInteger matchType;
@property (nonatomic) BOOL started;

@end
