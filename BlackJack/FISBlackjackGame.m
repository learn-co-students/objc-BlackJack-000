//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Molly Gingras on 2/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (void)playBlackjack {
    [self.deck resetDeck];
    [self dealNewRound];
    for (NSUInteger i = 0; i < 3; i++) {
        [self processPlayerTurn];
        if (self.player.busted) {
            break;
        }
        [self processHouseTurn];
        if (self.house.busted) {
            break;
        }
    }
    [self incrementWinsAndLossesForHouseWins:[self houseWins]];
    NSLog(@"%@", self.player);
    NSLog(@"%@", self.house);
}

- (void)dealNewRound {
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
}

- (void)dealCardToPlayer {
    [self.player acceptCard:[self.deck drawNextCard]];
}

- (void)dealCardToHouse {
    [self.house acceptCard:[self.deck drawNextCard]];

}

- (void)processPlayerTurn {
    if ([self.player shouldHit] && !self.player.busted && !self.player.stayed) {
        [self dealCardToPlayer];
    }
}

- (void)processHouseTurn {
    if ([self.house shouldHit] && !self.house.busted && !self.house.stayed) {
        [self dealCardToHouse];
    }
}

- (BOOL)houseWins {
    if (self.player.blackjack || self.house.busted) {
        return NO;
    }
    if (self.player.busted || self.player.handscore <= self.house.handscore) {
        return YES;
    }
    return NO;
}

- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    if (houseWins) {
        self.house.wins++;
        self.player.losses++;
        NSLog(@"%@", @"House wins!");
    }
    else {
        self.player.wins++;
        self.house.losses++;
        NSLog(@"%@", @"Player wins!");
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    return self;
}


@end
