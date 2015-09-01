//
//  FISPlayingCardDeck.h
//  BlackJack
//
//  Created by Kevin Tsai on 8/30/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCard.h"

@interface FISPlayingCardDeck : NSObject

@property(strong, nonatomic)NSMutableArray *cards;

-(instancetype)init;
-(FISPlayingCard *)drawRandomCard;


@end
