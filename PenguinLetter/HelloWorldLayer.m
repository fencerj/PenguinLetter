//
//  HelloWorldLayer.m
//  PenguinLetter
//
//  Created by Ivan on 13-5-9.
//  Copyright Ivan 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        
        CCSprite *bg = [CCSprite spriteWithFile:@"Z0Bg_0.jpg"];             //z0
        bg.anchorPoint = CGPointZero;
        [self addChild:bg z:0];
        
        
        CCSprite *Z1Item0 = [CCSprite spriteWithFile:@"Z1SceneItem_0.png"];
        CCSprite *Z1Item1 = [CCSprite spriteWithFile:@"Z1SceneItem_1.png"]; //z1
        
        CCSprite *Z2Item0 = [CCSprite spriteWithFile:@"Z2SceneItem_0.png"];
        CCSprite *Z2Item1 = [CCSprite spriteWithFile:@"Z2SceneItem_1.png"];
        
        CCSprite *Z3Item0 = [CCSprite spriteWithFile:@"Z3SceneItem_0.png"];
        CCSprite *Z3Item1 = [CCSprite spriteWithFile:@"Z3SceneItem_1.png"];
        CCSprite *Z3Item2 = [CCSprite spriteWithFile:@"Z3SceneItem_2.png"];
        CCSprite *Z3Item3 = [CCSprite spriteWithFile:@"Z3SceneItem_3.png"]; //z2
        
        
        CCParallaxNode *pNode = [CCParallaxNode node];
        //[pNode addChild:Z1Item0 z:1 parallaxRatio:0.1 positionOffset:60];
        
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	//[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
