//
//  FISCard.h
//  BlackJack
//
//  Created by Danny Fenjves on 10/6/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

+ (NSArray *)validSuits;
+ (NSArray *)validRanks;

@property (strong, nonatomic, readonly) NSString *suit;
@property (strong, nonatomic, readonly) NSString *rank;
@property (strong, nonatomic, readonly) NSString *cardLabel;
@property (nonatomic, readonly) NSUInteger cardValue;

- (instancetype)init;

- (instancetype)initWithSuit:(NSString *)suit
                        rank:(NSString *)rank;
@end
