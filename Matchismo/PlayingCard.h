//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sunil Varghese on 12/2/13.
//  Copyright (c) 2013 Sunil Varghese. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
