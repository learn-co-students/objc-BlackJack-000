//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISBlackjackGame.h"
#import "FISCardDeck.h"
#import "FISCard.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
  //  FISBlackjackPlayer *player = [[FISBlackjackPlayer alloc] initWithName:@"Katala"];
  //  FISCardDeck *deck = [[FISCardDeck alloc] init];
    
  //  [player acceptCard:[deck drawNextCard]];
    
  //  [player acceptCard:[deck drawNextCard]];
    
  //  [player acceptCard:[deck drawNextCard]];
    
  //  NSLog(@"%@", player);
    
    
    FISBlackjackGame *game = [[FISBlackjackGame alloc] init];
    
    [game playBlackjack];
    
    [game playBlackjack];
    
    [game playBlackjack];
    
    return YES;
}

@end
