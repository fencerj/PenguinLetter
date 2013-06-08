//
//  GameOverScene.m
//  PenguinLetter
//
//  Created by IvanMacAir on 13-6-9.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "GameOverScene.h"
#import "GameScene.h"

@implementation GameOverScene
+(id)sceneWin:(int)count
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    GameOverScene *layer = [[GameOverScene alloc] initGameWin:count];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;

}
+(id)sceneGameOver:(int)count
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    GameOverScene *layer = [[GameOverScene alloc] initGameOver:count];
    
    // add layer as a child to scene
    [scene addChild: layer];
    
    // return the scene
    return scene;
    
}

-(id)initGameWin:(int)count
{
    if (self = [super init]) {
        rightCount = count;
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"win.plist"];
        NSString *aniFileStr = @"win_ani";
        animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
        animationNode.timeScale = 1.0f;
        animationNode.visible = NO;
        animationNode.position = ccp(512,384);
        [self addChild:animationNode ];
        isWin = YES;
        
        time = [GameScene createRandomsizeValueFloat:30 toFloat:70];
        
    }
    return self;
}
-(id)initGameOver:(int)count
{
    if (self = [super init]) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"gameover.plist"];
        NSString *aniFileStr = @"gameover_ani";
        animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
        animationNode.timeScale = 1.0f;
        animationNode.visible = NO;
        animationNode.position = ccp(512,384);
        [self addChild:animationNode ];
    }
    return self;
}

-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    [self schedule:@selector(doAni) interval:0.1];
    [self scheduleOnce:@selector(aniFinished) delay:0.8];
    [animationNode setAnimation:@"animation" loop:NO];
    
}
-(void)doAni
{
    [self unschedule:_cmd];
    animationNode.visible = YES;
}
-(void)aniFinished//showMenu
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"gameover.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"win.plist"];
    CCLOG(@"add item");
    if (isWin) {
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"again"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Bagain"] block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameScene scene]]];
            
        }];
        
        CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"ditu"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Bditu"]  block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Map scene]]];
        }];
        item1.position = ccp(803.0,158.6);
        item2.position = ccp(213.2,160.3);
        
        CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"jixu"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Bjixu"]  block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameScene scene]]];
            
        }];
        item3.position = ccp(515.1,131.9);
        
        CCMenu *menu = [CCMenu menuWithItems:item1,item2, nil];
        [self addChild:menu z:3];
        menu.position = CGPointZero;
    }
    else
    {
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"again"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Bagain"] block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameScene scene]]];
            
        }];
        
        CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"ditu"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"Bditu"]  block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Map scene]]];
        }];
        item1.position = ccp(803.0,158.6);
        item2.position = ccp(213.2,160.3);
        
        CCMenu *menu = [CCMenu menuWithItems:item1,item2, nil];
        [self addChild:menu z:3];
        menu.position = CGPointZero;
    }
}

@end
