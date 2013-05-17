//
//  GameScene.m
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "GameScene.h"
#import "MaskedSprite.h"
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
@synthesize itemIntervalMin;
@synthesize itemIntervalMax;
@synthesize showZoneYMax;
@synthesize showZoneYMin;
@synthesize arr;
@synthesize mostX;
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
- (NSInteger)createRandomsizeValueInt:(NSInteger)fromInt toInt:(NSInteger)toInt
{
    if (toInt < fromInt)
    {
        return toInt;
    }
    if (toInt == fromInt)
    {
        return fromInt;
        ///12312312313231
    }
    NSInteger randVal = arc4random() % (toInt - fromInt + 1) + fromInt;
    return randVal;
}
- (double)createRandomsizeValueFloat:(double)fromFloat toFloat:(double)toFloat
{
    if (toFloat < fromFloat)
    {
        return toFloat;
    }
    if (toFloat == fromFloat)
    {
        return fromFloat;
    }
    double randVal = ((double)arc4random() / 0x100000000) * (toFloat - fromFloat) + fromFloat;
    return randVal;
}
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        [self initBg];
        [self initRole];
	}
	return self;
}
-(void)initBg
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_0.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_1.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_2.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_3.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_4.plist"];
    
    _purSpeed = -500;
    CCSprite *bg = [CCSprite spriteWithFile:@"sheep_scene_bg.pvr.ccz"];//z0
    bg.anchorPoint = CGPointZero;
    [self addChild:bg z:0];
    
    
    pNode = [CCParallaxNode node];
    [self addChild:pNode z:0];
    
    for (int i = 0; i < 9; i++) {
        parArr[i] = [[parallaxArr alloc] init];
    }
    
    CCSprite *itemTmp;
    float velVar;
    int itemCount;
    int zOrder;
    int countInSt;
    NSString *itemType;
    int randomNums ;
    int initPosX;
        
    //z1 setting
    velVar = 0.02;
    itemCount = 4;
    zOrder = 1;
    itemType = @"SceneItem_";
    randomNums = 0;
    countInSt = 6;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 300;
    parArr[zOrder-1].itemIntervalMax = 800;
    parArr[zOrder-1].showZoneYMin = 503;
    parArr[zOrder-1].showZoneYMax = 767;
    
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    
    velVar = 0.08;
    itemCount = 2;
    zOrder = 2;
    itemType = @"SceneItem_";
    randomNums = 0;
    countInSt = 7;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 350;
    parArr[zOrder-1].itemIntervalMax = 800;
    parArr[zOrder-1].showZoneYMin = 520;
    parArr[zOrder-1].showZoneYMax = 645;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    
    velVar = 0.15;
    itemCount = 2;
    zOrder = 3;
    itemType = @"SceneItem_";
    countInSt = 6;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 400;
    parArr[zOrder-1].itemIntervalMax = 800;
    parArr[zOrder-1].showZoneYMin = 370;
    parArr[zOrder-1].showZoneYMax = 638;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            
            parArr[zOrder-1].mostX = itemTmp.position;
            
        }
    }
    
    velVar = 0.25;
    itemCount = 3;
    zOrder = 4;
    itemType = @"SceneBg_";
    countInSt = 3;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = NO;
    for (int i = 0; i < itemCount; i++) {
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
        //parArr[zOrder-1].itemInterval = 1024*itemCount;
    }
    
    
    velVar = 0.4;
    itemCount = 3;
    zOrder = 5;
    itemType = @"SceneBg_";
    countInSt = 4;
    for (int i = 0; i < itemCount; i++) {
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
    }
    
    velVar = 0.6;
    itemCount = 2;
    zOrder = 6;
    itemType = @"SceneItem_";
    countInSt = 3;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 994;
    parArr[zOrder-1].itemIntervalMax = 994;
    parArr[zOrder-1].showZoneYMin = 384;
    parArr[zOrder-1].showZoneYMax = 384;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            
            parArr[zOrder-1].mostX = itemTmp.position;
            
        }
    }
    
    velVar = 1;
    itemCount = 2;
    zOrder = 7;
    itemType = @"SceneBg_";
    for (int i = 0; i < itemCount; i++) {
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
    }
    
    velVar = 1;
    itemCount = 2;
    zOrder = 8;
    itemType = @"SceneItem_";
    countInSt = 4;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 400;
    parArr[zOrder-1].itemIntervalMax = 600;
    parArr[zOrder-1].showZoneYMin = 117;
    parArr[zOrder-1].showZoneYMax = 117;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    
    velVar = 2;
    itemCount = 1;
    zOrder = 9;
    itemType = @"SceneItem_";
    countInSt = 3;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 1024;
    parArr[zOrder-1].itemIntervalMax = 3000;
    parArr[zOrder-1].showZoneYMin = 110;
    parArr[zOrder-1].showZoneYMax = 110;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [self createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp((i+1)*itemTmp.contentSize.width/2 +i*[self createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax],[self createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            
            parArr[zOrder-1].mostX = itemTmp.position;
            
        }
    }
    
    
    [self scheduleUpdate];

}
-(void)initRole
{
    MaskedSprite *sheep = [MaskedSprite spriteWithFile:@"sheep.png"];
    [self addChild:sheep z:3];
    sheep.position = ccp(512,384);
    
}
- (void)update:(ccTime)delta
{
    parallaxArr *par;
    pNode.position = ccpAdd(pNode.position, ccpMult(ccp(_purSpeed, 0), delta));
    for (int i = 0 ; i < 9; i++) {
        par = parArr[i];
       
        CCSprite *tmpSp;
        CCARRAY_FOREACH(par.arr, tmpSp)
        {
            CCSprite *back = (CCSprite*)tmpSp;
            float  curX = [pNode convertToWorldSpace:back.position].x ;
            
            //float  deltaX = curX + back.contentSize.width/2;
            if (curX< -back.contentSize.width/2-5) {
                
                
                
                if (par.isRandom == NO) {
                    
                    //CCLOG(@"curX = change%f",par.itemInterval);
                    [pNode incrementOffset:ccp(back.contentSize.width* [par.arr count] ,0) forChild:back];
                }
                else
                {
                    //CCSprite *lastItem = [par.arr lastObject];
                    //CCLOG(@"curX = change%f",par.itemInterval);
                    [pNode incrementOffset:ccp( [par.arr count]*par.itemIntervalMax ,0) forChild:back];

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
