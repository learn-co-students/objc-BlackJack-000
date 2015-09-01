//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Kevin Tsai on 8/30/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"


@implementation FISPlayingCardDeck

-(instancetype)init{
    self = [super init];
    if(self){
        _cards = [NSMutableArray array];
        NSArray *suits = [NSArray arrayWithObjects:@"♥", @"♠", @"♣", @"♦", nil];
        NSUInteger rank;
        for (rank=1; rank<14; rank++){
            for (NSString *suit in suits){
                [_cards addObject:[[FISPlayingCard alloc]initWithSuit:suit rank:@(rank)]];
            }
        }
        NSLog(@"%@", _cards);
    }
    return self;
};

-(FISPlayingCard *)drawRandomCard{
    NSUInteger r = arc4random_uniform(52);
    FISPlayingCard *removedCard = [self.cards objectAtIndex:r];
    [self.cards removeObjectAtIndex:r];
    return removedCard;
};

@end
