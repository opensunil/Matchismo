//
//  SetCard.m
//  Matchismo
//
//  Created by Sunil Varghese on 1/14/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count]==[SetCard maxNumber]-1){
        NSMutableArray *features = [[NSMutableArray alloc] init];
        
        // number match
        for (SetCard *card in otherCards){
            [features addObject:[NSString stringWithFormat:@"%d", card.number]];
        }
        if ([self matchFeature:[NSString stringWithFormat:@"%d", self.number] otherCardFeatures:features]) return 1;
        
        // symbols match
        [features removeAllObjects];
        for (SetCard *card in otherCards){
            [features addObject:card.symbol];
        }
        if ([self matchFeature:self.symbol otherCardFeatures:features]) return 1;
        
        // shadings match
        [features removeAllObjects];
        for (SetCard *card in otherCards){
            [features addObject:card.shading];
        }
        if ([self matchFeature:self.shading otherCardFeatures:features]) return 1;
        
        // colors match
        [features removeAllObjects];
        for (SetCard *card in otherCards){
            [features addObject:card.color];
        }
        if ([self matchFeature:self.color otherCardFeatures:features]) return 1;
    }
    return score;
}


- (BOOL)matchFeature:(NSString *)feature otherCardFeatures:(NSArray *)otherFeatures{
    int result = NO;
    
    if ([feature isEqualToString:otherFeatures[0]]){
        if ([feature isEqualToString:otherFeatures[1]]){
            result = YES;
        }
    }else{ // feature not equal to otherFeature[0]
        if (![feature isEqualToString:otherFeatures[1]]){
            result = YES;
        }
    }
    
    return result;
}

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
