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
+(id)sceneWin:(int)count time:(float)times
{
    // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
    GameOverScene *layer = [[GameOverScene alloc] initGameWin:count time:times];
    
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

-(id)initGameWin:(int)count time:(float)times
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
        
        time = times;
        
    }
    return self;
}
-(id)initGameOver:(int)count
{
    if (self = [super init]) {
        rightCount = count;
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
    [self schedule:@selector(doAni) interval:0.2];
    [self scheduleOnce:@selector(aniFinished) delay:1.3];
    if (isWin) {
        
        [animationNode setAnimation:@"winqian" loop:NO];
    }
    else
       [animationNode setAnimation:@"loseqian" loop:NO]; 
    
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
        
        CCMenu *menu = [CCMenu menuWithItems:item1,item2,item3,nil];
        [self addChild:menu z:3];
        menu.position = CGPointZero;
        
        
        CCSprite *star1 = [CCSprite spriteWithSpriteFrameName:@"start1"];
        CCSprite *star2 = [CCSprite spriteWithSpriteFrameName:@"start2"];
        CCSprite *star3 = [CCSprite spriteWithSpriteFrameName:@"start3"];
        
        if (rightCount>=6 )
        {
            [self addChild:star1 z:1];
            star1.position = ccp(251,503.8);
            star1.scale = 0;
            [star1 runAction:[CCEaseElasticOut actionWithAction:[CCScaleTo actionWithDuration:0.2 scale:1] period:2]];
        }
        if(rightCount >6 )
        {
            [self addChild:star2 z:1];
            star2.scale = 0;
            star2.position = ccp(454.4,589.5);
            [star2 runAction:[CCSequence actionOne:[CCDelayTime actionWithDuration:0.2] two:[CCEaseElasticOut actionWithAction:[CCScaleTo actionWithDuration:0.2 scale:1] period:2]]];
        }
        if(rightCount==10)
        {
            [self addChild:star3 z:1];
            star3.scale = 0;
            star3.position = ccp(657.1,566);
            [star3 runAction:[CCSequence actionOne:[CCDelayTime actionWithDuration:0.4] two:[CCEaseElasticOut actionWithAction:[CCScaleTo actionWithDuration:0.2 scale:1] period:2]]];
        }
        
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
    
    
    labelCount = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",rightCount] fontName:@"IMPACT.TTF" fontSize:42];
    labelCount.position = ccp(540.9, 349.1);
    [self addChild:labelCount z:1];
    labelCount.opacity =0;
    
    labelTime = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%.2fS",time] fontName:@"IMPACT.TTF" fontSize:42];
    labelTime.position = ccp(495.9+20, 452.7);
    [self addChild:labelTime z:1];
    labelTime.opacity =0;
    labelTime.rotation = 4;
    
    if (isWin) {
        
        [labelTime runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.5],[CCCallBlock actionWithBlock:^{
            [labelCount runAction:[CCFadeIn actionWithDuration:0.5]];
            
        }],[CCDelayTime actionWithDuration:.5],[CCCallBlock actionWithBlock:^{
            
            [animationNode setAnimation:@"winhou" loop:NO];
            
        }], nil]];
    }
    else
    {
        labelCount.position  = ccpAdd(labelCount.position, ccp(-2,3));
        [labelCount runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.8],[CCCallBlock actionWithBlock:^{
            [animationNode setAnimation:@"losehou" loop:NO];
        }], nil]];
    }
    
}

@end
