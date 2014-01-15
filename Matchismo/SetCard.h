//
//  SetCard.h
//  Matchismo
//
//  Created by Sunil Varghese on 1/14/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSInteger number;
@property (nonatomic) NSString *symbol;
@property (nonatomic) NSString *shading;
@property (nonatomic) NSString *color;

+ (NSArray *)validSymbols;
+ (NSArray *)validShadings;
+ (NSArray *)validColors;
+ (NSInteger)maxNumber;

@end
