//
//  Card.h
//  Matchismo
//
//  Created by Sunil Varghese on 11/26/13.
//  Copyright (c) 2013 Sunil Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
