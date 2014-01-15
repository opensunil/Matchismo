//
//  SetCard.m
//  Matchismo
//
//  Created by Sunil Varghese on 1/14/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)validSymbols{
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validShadings{
    return @[@"solid", @"striped", @"open"];
}

+ (NSArray *)validColors{
    return @[@"red", @"green", @"purple"];
}

+ (NSInteger)maxNumber{
    return 3;
}

@end
