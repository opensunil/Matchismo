//
//  MatchingCardResults.m
//  Matchismo
//
//  Created by Sunil Varghese on 1/10/14.
//  Copyright (c) 2014 Sunil Varghese. All rights reserved.
//

#import "MatchingCardResults.h"

@interface MatchingCardResults()
@property (nonatomic, strong) NSMutableArray *matches;
@property (nonatomic, strong) NSMutableArray *failedMatches;
@end

@implementation MatchingCardResults

- (NSMutableArray *)matches{
    if (!_matches){
        _matches = [[NSMutableArray alloc] init];
    }
    return _matches;
}

- (NSMutableArray *)failedMatches{
    if (!_failedMatches){
        _failedMatches = [[NSMutableArray alloc] init];
    }
    return _failedMatches;
}

- (void)setMatchCard:(Card *)card withChosenCards:(NSArray *)chosenCards{
    [self.matches removeAllObjects];
    [self.matches addObject:card];
    [self.matches addObjectsFromArray:chosenCards];
}

- (void)setFailedMatchCard:(Card *)card
           withChosenCards:(NSArray *)chosenCards{
    [self.failedMatches removeAllObjects];
    [self.failedMatches addObject:card];
    [self.failedMatches addObjectsFromArray:chosenCards];
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (NSArray *)getMatches{
    return self.matches;
}

- (NSArray *)getFailedMatches{
    return self.failedMatches;
}

@end
