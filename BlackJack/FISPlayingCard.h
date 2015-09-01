//
//  FISPlayingCard.h
//  BlackJack
//
//  Created by Kevin Tsai on 8/30/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISPlayingCard : NSObject

@property(strong, nonatomic)NSString *suit;
@property(strong, nonatomic)NSNumber *rank;

-(instancetype)init;
-(instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank;
-(NSString *)description;
-(NSNumber *)rank;
-(NSString *)suit;


@end
