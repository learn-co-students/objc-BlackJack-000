//
//  FISBlackjackPlayer.h
//  BlackJack
//
//  Created by Danny Fenjves on 10/6/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISBlackjackPlayer : NSObject

@property (strong, nonatomic)NSString *name;

@property(strong,nonatomic)NSMutableArray *cardsInHand;

@property(nonatomic)BOOL aceInHand;

@property(nonatomic)BOOL blackjack;

@property(nonatomic)BOOL busted;

@property(nonatomic)BOOL stayed;

@property (nonatomic)NSUInteger handscore;

@property (nonatomic)NSUInteger wins;

@property (nonatomic)NSUInteger losses;

-(instancetype)initWithName:(NSString *) name;

-(void)resetForNewGame;

-(void)acceptCard:(FISCard *)card;

-(BOOL)shouldHit;

@end
