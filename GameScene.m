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

@implementation parallaxArr

-(id)init
{
    if (self = [super init]) {
        arr = [CCArray arrayWithCapacity:10];
    }
    return self;
}
@synthesize zOrder;
@synthesize isRandom;
@synthesize itemInterval;
@synthesize arr;
@end

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
        
        
        
        _purSpeed = -500;
        CCSprite *bg = [CCSprite spriteWithFile:@"sheep_scene_bg.pvr.ccz"];             //z0
        bg.anchorPoint = CGPointZero;
        [self addChild:bg z:0];
        
        
        pNode = [CCParallaxNode node];
        [self addChild:pNode z:0];
        
        for (int i = 0; i < 9; i++) {
            parArr[i] = [[parallaxArr alloc] init];
        }

        
        
        CCSprite *itemTmp;
        float velVar = 0.1;
        int itemCount = 2;
        int zOrder = 1;
        NSString *itemType = @"SceneItem_";
        
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*CCRANDOM_0_1()*600+200, CCRANDOM_0_1()*300+500)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = CCRANDOM_0_1()*100+800;
        }
        
        
        velVar = 0.2;
        itemCount = 2;
        zOrder = 2;
        itemType = @"SceneItem_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*CCRANDOM_0_1()*600+200, CCRANDOM_0_1()*100+400)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = CCRANDOM_0_1()*100+500;
        }
        
        velVar = 0.3;
        itemCount = 4;
        zOrder = 3;
        itemType = @"SceneItem_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*CCRANDOM_0_1()*400+200, CCRANDOM_0_1()*300+500)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = CCRANDOM_0_1()*100+200;
        }
        
        velVar = 0.3;
        itemCount = 3;
        zOrder = 4;
        itemType = @"SceneBg_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = NO;
            parArr[zOrder-1].itemInterval = 1024*itemCount;
        }
        
        
        velVar = 0.4;
        itemCount = 3;
        zOrder = 5;
        itemType = @"SceneBg_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = NO;
            parArr[zOrder-1].itemInterval = 1024*itemCount;
        }
        
        velVar = 0.6;
        itemCount = 2;
        zOrder = 6;
        itemType = @"SceneItem_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*1024+500, 384)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = 400;

        }
        
        velVar = 1;
        itemCount = 2;
        zOrder = 7;
        itemType = @"SceneBg_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = NO;
            parArr[zOrder-1].itemInterval = 1024*itemCount;

            
        }
        
        velVar = 1;
        itemCount = 2;
        zOrder = 8;
        itemType = @"SceneItem_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*CCRANDOM_0_1()*600+200, 109)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = CCRANDOM_0_1()*300+300;
        }
        
        velVar = 1;
        itemCount = 1;
        zOrder = 9;
        itemType = @"SceneItem_";
        for (int i = 0; i < itemCount; i++) {
            itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
            [parArr[zOrder-1].arr addObject:itemTmp];
            [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(i*CCRANDOM_0_1()*600+200, itemTmp.contentSize.height/2-10)];
            parArr[zOrder-1].zOrder = zOrder;
            parArr[zOrder-1].isRandom = YES;
            parArr[zOrder-1].itemInterval = CCRANDOM_0_1()*300+300;
        }
        
             
        [self scheduleUpdate];
        //[pNode runAction:[CCMoveBy actionWithDuration:20 position:ccp(-2000, 0)]];
        
       
        //[pNode addChild:Z1Item0 z:1 parallaxRatio:0.1 positionOffset:60];
        
        //CCMenuItemLabel *item1 = [CCMenuItemLabel itemWithLabel:@""];
        
	}
	return self;
}
- (void)update:(ccTime)delta
{
    parallaxArr *par;
    pNode.position = ccpAdd(pNode.position, ccpMult(ccp(_purSpeed, 0), delta));
    for (int i = 0 ; i < 9; i++) {
        par = parArr[i];
        if (par.isRandom == NO) {
            CCSprite *tmpSp;
            CCARRAY_FOREACH(par.arr, tmpSp)
            {
                CCSprite *back = (CCSprite*)tmpSp;
                float  curX = [pNode convertToWorldSpace:back.position].x ;
                
                float  deltaX = curX + back.contentSize.width/2;
                if (curX< -back.contentSize.width/2-5) {
                    CCLOG(@"curX = change%f",par.itemInterval);
                    [pNode incrementOffset:ccp(par.itemInterval,0) forChild:back];
                }
                
            }
        }
    }

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
