//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Sunil Varghese on 1/14/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

@end
