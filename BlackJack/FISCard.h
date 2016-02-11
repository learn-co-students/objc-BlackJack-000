//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Molly Gingras on 2/11/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (strong, nonatomic, readonly) NSString *suit;
@property (strong, nonatomic, readonly) NSString *rank;
@property (strong, nonatomic, readonly) NSString *cardLabel;
@property (nonatomic, readonly) NSUInteger cardValue;

+ (NSArray *)validSuits;
+ (NSArray *)validRanks;

- (instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank;
- (instancetype)init;
- (NSString *)description;

@end
