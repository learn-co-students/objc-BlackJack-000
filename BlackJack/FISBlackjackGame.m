//
//  FISBlackJackGame.m
//  BlackJack
//
//  Created by Kevin Tsai on 8/30/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init{
    self = [super init];
    if(self){
        _playingCardDeck = [[FISPlayingCardDeck alloc] init];
        _handScore = @0;
        _hand = [NSMutableArray array];
        _isBusted = NO;
        _isBlackjack = NO;
    }
    return self;
};

-(NSNumber *)handScore{
    
    NSInteger sumOfNonAces = 0;
    NSInteger sumOfAces = 0;
    NSInteger sum = 0;
    NSArray *faceCards = [NSArray arrayWithObjects:@11, @12, @13, nil];
    
    for(FISPlayingCard *card in self.hand){
        
        if([card.rank intValue]> 1){
            if([faceCards containsObject:card.rank]){
                /*This is a face card, the value should be @10*/
                card.rank = @10;
                sumOfNonAces += [card.rank intValue];
            } else {
                sumOfNonAces += [card.rank intValue];
            }
        } else {
            sumOfAces += [card.rank intValue];
        }
    }
    
    NSMutableArray *arrayOfAces = [NSMutableArray array];
    
    for(FISPlayingCard *card in self.hand){
        if([card.rank isEqual:@1]){
            [arrayOfAces addObject:card];
        }
    }
    
    sum = sumOfNonAces;
    
    NSInteger countOfAces = [arrayOfAces count];
    
    for (NSInteger i=0; i<countOfAces; i++){
        if(sum + countOfAces < 12){
            sum += 11;
        } else {
            sum += 1;
        }
    };
    
    _handScore = @(sum);
    
    if([_handScore intValue] > 21){
        _isBusted = YES;
    } else {
        _isBusted = NO;
    }

    return _handScore;
    
};

-(BOOL)isBusted{
    [self handScore];
    return _isBusted;
};

- (void)deal{
    NSLog(@"Deal two cards");
    [self.hand addObject:(self.playingCardDeck.drawRandomCard)];
    [self.hand addObject:(self.playingCardDeck.drawRandomCard)];
    NSLog(@"The dealt hand is: %@", self.hand);
};

- (void)hit{
    if([[self handScore] intValue] < 21 && [self.hand count] > 1) {
        [self.hand addObject:(self.playingCardDeck.drawRandomCard)];
    }
};

@end
