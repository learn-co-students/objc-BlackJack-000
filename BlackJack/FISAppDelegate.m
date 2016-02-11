//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackGame.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISBlackjackPlayer *player = [[FISBlackjackPlayer alloc] initWithName:@"Molly"];
    FISCardDeck *deck = [[FISCardDeck alloc] init];
    [deck shuffleRemainingCards];
    [player acceptCard:[deck drawNextCard]];
    NSLog(@"%@", player);
    
    FISBlackjackGame *game = [[FISBlackjackGame alloc] init];
    [game playBlackjack];
    [game playBlackjack];
    [game playBlackjack];
    
    return YES;
}

@end
