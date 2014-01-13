//
//  MatchingCardResults.h
//  Matchismo
//
//  Created by Sunil Varghese on 1/10/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface MatchingCardResults : NSObject

@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger scoreChange;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL penalty;
@property (nonatomic, strong) Card *card;


- (void)setMatchCard:(Card *)card
     withChosenCards:(NSArray *)chosenCards;
- (void)setFailedMatchCard:(Card *)card
           withChosenCards:(NSArray *)chosenCards;
- (NSArray *)getMatches;
- (NSArray *)getFailedMatches;

@end
