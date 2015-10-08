//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Danny Fenjves on 10/6/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype)initWithName:(NSString *) name{
    self = [super init];
    if (self) {
        _name = name;
        _cardsInHand = [[NSMutableArray alloc]init];
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

- (instancetype)init
{
    self = [self initWithName:@""];
    return self;
}

-(void)resetForNewGame{
    [self.cardsInHand removeAllObjects];
    self.aceInHand = NO;
    self.blackjack = NO;
    self.busted = NO;
    self.stayed = NO;
    self.handscore = 0;
}

-(void)acceptCard:(FISCard *)card{
    [self.cardsInHand addObject:card];
    self.handscore = [[self.cardsInHand valueForKeyPath:@"@sum.cardValue"]unsignedIntegerValue];
    NSArray *values = [self.cardsInHand valueForKey:@"cardValue"];
    if ([values containsObject:@1]){
        self.aceInHand = YES;
    }
    if (self.handscore <= 11 && self.aceInHand) {
        self.handscore += 10;
    }
    if (self.handscore == 21) {
        self.blackjack = YES;
    } else if (self.handscore >21){
        self.busted = YES;
    }
}

-(BOOL)shouldHit{
    if (self.handscore < 17) {
        return YES;
    }
    self.stayed = YES;
    return NO;
}

-(NSString *)description{
    NSString *output = [NSString stringWithFormat:@"name:%@ \n cards:%@ \n handscore:%lu \n ace:%d \n blackjack:%d \n busted:%d \n stayed:%d \n wins:%lu \n losses:%lu", self.name, self.cardsInHand, self.handscore, self.aceInHand, self.blackjack, self.busted, self.stayed, self.wins, self.losses];
    //
    return output;
}

@end
