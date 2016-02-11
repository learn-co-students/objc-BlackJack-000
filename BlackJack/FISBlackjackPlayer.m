//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Molly Gingras on 2/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc] init];
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
        _handscore = 0;
        _wins = 0;
        _losses = 0;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithName:@""];
    return self;
}

- (void)resetForNewGame {
    self.cardsInHand = [[NSMutableArray alloc] init];
    _aceInHand = NO;
    _blackjack = NO;
    _busted = NO;
    _stayed = NO;
    self.handscore = 0;
}

- (void)acceptCard:(FISCard *)card {
    [self.cardsInHand addObject:card];
    self.handscore = [[self.cardsInHand valueForKeyPath:@"@sum.cardValue"] integerValue];
    NSPredicate *acePredicate = [NSPredicate predicateWithFormat:@"rank = 'A'"];
    self.aceInHand = [self.cardsInHand filteredArrayUsingPredicate:acePredicate].count;
    if (self.aceInHand && self.handscore <= 11) {
        self.handscore += 10;
    }
    if (self.handscore == 21 && self.cardsInHand.count == 2) {
        self.blackjack = YES;
    }
    else if (self.handscore > 21) {
        self.busted = YES;
    }
    
}

- (BOOL)shouldHit {
    if (self.handscore > 16) {
        _stayed = YES;
        return NO;
    }
    return YES;
}

- (NSString *)description {
    NSString *cardLabels = [[self.cardsInHand valueForKey:@"cardLabel"] componentsJoinedByString:@" "];
    return [NSString stringWithFormat:@"name: %@\ncards: %@\nhandscore: %lu\nace in hand: %d\nstayed: %d\nblackjack: %d\nbusted: %d\nwins: %lu\nlosses: %lu\n", self.name, cardLabels, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
}


@end
