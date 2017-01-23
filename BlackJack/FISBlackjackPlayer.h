//
//  FISBlackjackPlayer.h
//  BlackJack
//
//  Created by Katala on 1/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISBlackjackPlayer : NSObject

@property(strong, nonatomic, readonly) NSString *name;
@property(strong, nonatomic, readonly) NSMutableArray *cardsInHand;

@property(nonatomic) BOOL aceInHand;
@property(nonatomic) BOOL blackjack;
@property(nonatomic) BOOL busted;
@property(nonatomic) BOOL stayed;

@property(nonatomic, readonly) NSUInteger handscore;
@property(nonatomic) NSUInteger wins;
@property(nonatomic) NSUInteger losses;

-(instancetype)initWithName:(NSString *) name;

-(void)resetForNewGame;

-(void)acceptCard:(FISCard *) name;

-(BOOL)shouldHit;


@end
