//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Molly Gingras on 2/11/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"
#import "FISCard.h"

@implementation FISCardDeck

- (FISCard *)drawNextCard {
    if (!self.remainingCards.count) {
        return nil;
    }
    FISCard *nextCard = [self.remainingCards lastObject];
    [self.dealtCards addObject:nextCard];
    [self.remainingCards removeObject:nextCard];
    return nextCard;
}

- (void)resetDeck {
    self.remainingCards = [[NSMutableArray alloc] init];
    self.dealtCards = [[NSMutableArray alloc] init];
    [self createDeck];
    [self shuffleRemainingCards];
}

- (void)gatherDealtCards {
    [self resetDeck];
}

- (void)shuffleRemainingCards {
    NSMutableArray *shuffledArray = [[NSMutableArray alloc] init];
    NSUInteger cardCount = self.remainingCards.count;
    for (NSUInteger i = 0; i < cardCount; i++) {
        NSUInteger randomIndex = arc4random_uniform((u_int32_t)self.remainingCards.count);
        [shuffledArray addObject:self.remainingCards[randomIndex]];
        [self.remainingCards removeObjectAtIndex:randomIndex];
    }
    self.remainingCards = shuffledArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self createDeck];
    }
    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"count: %lu\ncards:\n", self.remainingCards.count];
    
    NSSortDescriptor *sortBySuit = [NSSortDescriptor sortDescriptorWithKey:@"suit" ascending:YES comparator:^(NSString *suit1, NSString *suit2) {
        NSNumber *index1 = @([[FISCard validSuits] indexOfObject:suit1]);
        NSNumber *index2 = @([[FISCard validSuits] indexOfObject:suit2]);
        return [index1 compare:index2];
    }];
    NSSortDescriptor *sortByRank = [NSSortDescriptor sortDescriptorWithKey:@"rank" ascending:YES comparator:^(NSString *rank1, NSString *rank2) {
        NSNumber *index1 = @([[FISCard validRanks] indexOfObject:rank1]);
        NSNumber *index2 = @([[FISCard validRanks] indexOfObject:rank2]);
        return [index1 compare:index2];
    }];
    NSArray *sortedCards = [self.remainingCards sortedArrayUsingDescriptors:@[sortBySuit, sortByRank]];
    
    NSString *prevSuit = ((FISCard *)sortedCards[0]).suit;
    for (FISCard *card in sortedCards) {
        if (![card.suit isEqualToString:prevSuit]) {
            prevSuit = card.suit;
            [description appendString:@"\n"];
        }
        [description appendFormat:@" %@", card];
    }
    NSLog(@"%@", description);
    return description;
}

- (void)createDeck {
    for (NSString *suit in [FISCard validSuits]) {
        for (NSString *rank in [FISCard validRanks]) {
            [self.remainingCards addObject:[[FISCard alloc] initWithSuit:suit rank:rank]];
        }
    }
}

@end
