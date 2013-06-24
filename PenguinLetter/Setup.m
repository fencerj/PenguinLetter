//
//  Setup.m
//  PenguinLetter
//
//  Created by Ivan on 13-6-8.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "Setup.h"
#import "CCScrollView.h"

@implementation Setup
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Setup *layer = [Setup node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id)init
{
    if (self = [super init]) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"setup.plist"];
        
      
        
        CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"houjing"];
        bg.anchorPoint = ccp(0,0);
        [self addChild:bg];
        
        NSString *aniFileStr = @"setup_ani";
        animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
        animationNode.timeScale = 1.0f;
        animationNode.visible = NO;
        animationNode.position = ccp(512,384);
        [self addChild:animationNode ];
        
        CCSprite *fg = [CCSprite spriteWithSpriteFrameName:@"qianjing"];
        fg.anchorPoint = ccp(0,0);
        [self addChild:fg];
        
        
        pic     = [CCSprite spriteWithSpriteFrameName:@"zimu"];
        pic.position = ccp(315,-30);
        [self addChild:pic];
        CCSprite *zz = [CCSprite spriteWithSpriteFrameName:@"zhezhao"];
        zz.anchorPoint = ccp(0,0);
        [self addChild:zz];
        
        
        
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"fanhui1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"fanhui"] block:^(id sender){
             [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[MainMenu scene]]];
            
        }];
        
        item1.position = ccp(107,87);
        
        CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"shengxiao1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"shengxiao"]  block:^(id sender){
           
        }];
        item2.position = ccp(786,405-30);
        
        CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"yinxiao1"]  selectedSprite: [CCSprite spriteWithSpriteFrameName:@"yinxiao"] block:^(id sender){
        }];
        item3.position = ccp(920-5,261-2);
        
        
        CCMenuItemSprite *item4 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"jianti"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"yingwen"]  block:^(id sender){
           
        }];
        item4.position = ccp(689.3,261.3);
        
        CCMenu *menu = [CCMenu menuWithItems:item1,item2,item3,item4, nil];
        [self addChild:menu z:3];
        menu.position = CGPointZero;
        
    }
    return self;
}
-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    NSString *aniStr = @"animation";
    [self schedule:@selector(doAni) interval:0.1];
    //[self scheduleOnce:@selector(aniFinished) delay:0.8];
    [animationNode setAnimation:aniStr loop:NO];
    [pic runAction:[CCMoveTo actionWithDuration:20 position:ccp(315,314)]];
    
}
-(void)doAni
{
    [self unschedule:_cmd];
    animationNode.visible = YES;
}

@end
