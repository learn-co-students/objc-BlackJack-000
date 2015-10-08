//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Danny Fenjves on 10/6/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init
{
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc]init];
        _player = [[FISBlackjackPlayer alloc]initWithName:@"Player"];
        _house= [[FISBlackjackPlayer alloc]initWithName:@"House"];
    }
    return self;
}

-(void)playBlackjack{
    [self.deck resetDeck];
    [self dealNewRound];
    for (NSUInteger i=0; i<3; i++) {
        [self processPlayerTurn];
        if (self.player.busted) {
            break;
        }
        [self processHouseTurn];
        if (self.house.busted) {
            break;
        }
    }
    BOOL result = [self houseWins];
    [self incrementWinsAndLossesForHouseWins:result];
    NSLog(@"%@", self.player.description);
    NSLog(@"%@", self.house.description);
}

-(void)dealNewRound{
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
}

-(void)dealCardToPlayer{
    FISCard *card = self.deck.drawNextCard;
    [self.player acceptCard:card];
}

-(void)dealCardToHouse{
    FISCard *card = self.deck.drawNextCard;
    [self.house acceptCard:card];
}

-(void)processPlayerTurn{
    if (self.player.shouldHit && !self.player.busted && !self.player.stayed) {
        [self dealCardToPlayer];
    }
}

-(void)processHouseTurn{
    if (self.house.shouldHit && !self.house.busted && !self.house.stayed) {
        [self dealCardToHouse];
    }
}

-(BOOL)houseWins{
    if ((self.player.blackjack && self.house.blackjack)||self.house.busted) {
        return NO;
    }
    if (self.player.busted || self.house.handscore >= self.player.handscore) {
        return YES;
    }
    return NO;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL) houseWins{
    if (houseWins) {
        self.house.wins++;
        self.player.losses++;
    } else {
        self.player.wins++;
        self.house.losses++;
    }
    
}


@end
