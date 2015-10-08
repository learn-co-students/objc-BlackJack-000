//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Danny Fenjves on 10/6/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCardDeck.h"
#import "FISBlackjackPlayer.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISCardDeck *deck;

@property (strong, nonatomic) FISBlackjackPlayer *house;

@property (strong, nonatomic) FISBlackjackPlayer *player;

-(instancetype)init;

-(void)playBlackjack;

-(void)dealNewRound;

-(void)dealCardToPlayer;

-(void)dealCardToHouse;

-(void)processPlayerTurn;

-(void)processHouseTurn;

-(BOOL)houseWins;

-(void)incrementWinsAndLossesForHouseWins:(BOOL) houseWins;

@end
