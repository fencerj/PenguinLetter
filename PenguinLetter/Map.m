//
//  Setup.m
//  PenguinLetter
//
//  Created by Ivan on 13-6-8.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "Map.h"
#import "GameScene.h"
@implementation Map
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Map *layer = [Map node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id)init
{
    if (self = [super init]) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"map.plist"];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"bg"];
        bg.anchorPoint = ccp(0,0);
        [self addChild:bg];
        
        CCSprite *map_road_star = [CCSprite spriteWithSpriteFrameName:@"map_road_star"];
        map_road_star.position = ccp(512,384);
        //map_road_star.anchorPoint = CGPointMake(1, 1);
        [self addChild:map_road_star];
   
        {
            CCSprite *map_road_men = [CCSprite spriteWithSpriteFrameName:@"map_road_sheep"];
            map_road_men.position = ccp(412.5,240);
            [self addChild:map_road_men];
        }
        
        {
            CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_home1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_home1"] block:^(id sender){
                
            }];
            
            item1.position = ccp(512,384);
            
            CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_sheep1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_sheep1"]  block:^(id sender){
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameScene scene]]];
                
                
            }];
            item2.position = ccp(203.7,162.3);
            
            //
            
            CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_men2"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_men2"]  block:^(id sender){
                
            }];
            item3.position = ccp(857.7,506.5);
           
            
            
            CCMenuItemSprite *item4 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_ma2"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_ma2"]  block:^(id sender){
                
            }];
            item4.position = ccp(170.9,383.6);
            
            
            
            CCMenuItemSprite *item5 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_kou2"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_kou2"]  block:^(id sender){
                
            }];
            item5.position = ccp(446.2,677.6);
            
            CCMenuItemSprite *item6 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"game_niu2"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"game_niu2"]  block:^(id sender){
                
            }];
            item6.position = ccp(201.4,575.7);
            
            
            {
                CCSprite *lock = [CCSprite spriteWithSpriteFrameName:@"lock1"];
                [self addChild:lock z:2];
                lock.position = ccp(173.4,353.0);
            }
            
            {
                CCSprite *lock = [CCSprite spriteWithSpriteFrameName:@"lock1"];
                [self addChild:lock z:2];
                lock.position = ccp(194.2,555.2);
            }
            
            {
                CCSprite *lock = [CCSprite spriteWithSpriteFrameName:@"lock1"];
                [self addChild:lock z:2];
                lock.position = ccp(443.0,672.7);
            }
            
            {
                CCSprite *lock = [CCSprite spriteWithSpriteFrameName:@"lock1"];
                [self addChild:lock z:2];
               lock.position = ccp(805.2,520.1);
            }
            
            
            
            
            
            CCMenu *menu = [CCMenu menuWithItems:item1,item2,item3,item4, item5,item6,nil];
            [self addChild:menu ];
            menu.position = CGPointZero;
        }
        
//        NSString *aniFileStr = @"map_ani";
//        animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
//        animationNode.timeScale = 1.0f;
//        animationNode.visible = NO;
//        animationNode.position = ccp(512,384);
//        [self addChild:animationNode ];
        
        CCSprite *fg = [CCSprite spriteWithSpriteFrameName:@"fgframe"];
        fg.anchorPoint = ccp(0,0);
        [self addChild:fg ];
        
        
               
        
        
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"back2"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"back1"] block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[MainMenu scene]]];
            
        }];
        
        item1.position = ccp(49.5,50.2);
        CCMenu *menu = [CCMenu menuWithItems:item1,nil];
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
    
}
-(void)doAni
{
    [self unschedule:_cmd];
    animationNode.visible = YES;
}

@end
