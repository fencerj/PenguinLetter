//
//  GameScene.m
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "GameScene.h"
#define Z1ItemTag = 100
#define Z2ItemTag = 200
#define Z3ItemTag = 300
#define Z4ItemTag = 400
#define Z5ItemTag = 500
#define Z6ItemTag = 600
#define Z7ItemTag = 600



@implementation GameScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
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
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_0.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_1.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_2.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_3.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_4.plist"];
        
        
        CCSprite *bg = [CCSprite spriteWithFile:@"sheep_scene_bg.pvr.ccz"];             //z0
        bg.anchorPoint = CGPointZero;
        [self addChild:bg z:0];
        
        
        CCSprite *Z1Item0 = [CCSprite spriteWithSpriteFrameName:@"Z1SceneItem_0"];
        CCSprite *Z1Item1 = [CCSprite spriteWithSpriteFrameName:@"Z1SceneItem_1"]; //z1
        
        CCSprite *Z2Item0 = [CCSprite spriteWithFile:@"Z2SceneItem_0.png"];
        CCSprite *Z2Item1 = [CCSprite spriteWithFile:@"Z2SceneItem_1.png"];//z2
        
        CCSprite *Z3Item0 = [CCSprite spriteWithFile:@"Z3SceneItem_0.png"];
        CCSprite *Z3Item1 = [CCSprite spriteWithFile:@"Z3SceneItem_1.png"];
        CCSprite *Z3Item2 = [CCSprite spriteWithFile:@"Z3SceneItem_2.png"];
        CCSprite *Z3Item3 = [CCSprite spriteWithFile:@"Z3SceneItem_3.png"]; //z3
        
        CCSprite *Z4Item0 = [CCSprite spriteWithFile:@"Z3SceneItem_0.png"];
        CCSprite *Z4Item1 = [CCSprite spriteWithFile:@"Z3SceneItem_1.png"];
        CCSprite *Z4Item2 = [CCSprite spriteWithFile:@"Z3SceneItem_2.png"];//z4
       
        
        CCSprite *Z5Item0 = [CCSprite spriteWithFile:@"Z3SceneItem_0.png"];
        CCSprite *Z5Item1 = [CCSprite spriteWithFile:@"Z3SceneItem_1.png"];
        CCSprite *Z5Item2 = [CCSprite spriteWithFile:@"Z3SceneItem_2.png"];//z5
        
        
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

@end
