//
//  MainMenu.m
//  PenguinLetter
//
//  Created by Ivan on 13-6-8.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenu *layer = [MainMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init
{
    if (self = [super init]) {
        //        CCMenuItem *start = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:nil target:self selector:@selector(GameStart)];
        //        start.position = ccp(0,500);
        //        CCMenuItem *opition = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:nil target:self selector:@selector(GameOpition)];
        //        opition.position = ccp(0,400);
        //        CCMenuItem *about = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:nil target:self selector:@selector(GameAbout)];
        //        about.position = ccp(0,300);
        //        CCMenuItem *game = [CCMenuItemImage itemWithNormalImage:@"Icon.png" selectedImage:nil target:self selector:@selector(LittleGame)];
        //        game.position = ccp(0,200);
        //
        //        mainMenu = [CCMenu menuWithItems:start,opition,about,game, nil];
        //        mainMenu.position = ccp(700,300);
        //        [self addChild:mainMenu];

        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"menu_tp.plist"];
        CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"bg"];
        bg.anchorPoint= ccp(0,0);
        [self addChild:bg];
        
        animationNode = [CCSkeletonAnimation skeletonWithFile:@"MainMenu_ani.json" atlasFile:@"MainMenu_ani.atlas" scale:0.5];
        animationNode.timeScale = 1.0f;
        animationNode.visible = NO;
       
       // animationNode.anchorPoint = ccp(0,0);
        animationNode.position = ccp(512,0);
        [self addChild:animationNode ];
        
        //[self schedule:@selector(doAni) interval:3];
        CCSprite *fg = [CCSprite spriteWithSpriteFrameName:@"fg"];
        fg.anchorPoint= ccp(0,0);
        [self addChild:fg];
        //[self addBackGround];
        
        
        
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
    //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"menu_tp.plist"];
    CCLOG(@"add item");
    CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"play1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"play2"] block:^(id sender){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Loading initWithTargetScene:@"ComicScene"]]];
    
    }];
    
    CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"shezhi1"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"shezhi2"]  block:^(id sender){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Setup scene]]];
    }];
    item1.position = ccp(726.6-3,445.4+2);
    item2.position = ccp(931.4-2-2,456.2+2);
    
    CCMenu *menu = [CCMenu menuWithItems:item1,item2, nil];
    [self addChild:menu z:3];
    menu.position = CGPointZero;
    
}
-(void)dealloc
{
    [super dealloc];
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
}

@end
