//
//  GameScene.m
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "GameScene.h"
#import "MaskedSprite.h"
#import "GameOverScene.h"
#define Z1ItemTag = 100
#define Z2ItemTag = 200
#define Z3ItemTag = 300
#define Z4ItemTag = 400
#define Z5ItemTag = 500
#define Z6ItemTag = 600
#define Z7ItemTag = 600
#define FrontGroundRadio 1.8
#define FirstSpeed -1000


//#define Z1RADIO 0.02
//#define Z1KINDS 4
//#define Z1NUMS  3
//#define Z1TYPE  0
//#define Z2RADIO 0.08
//#define Z2KINDS 2
//#define Z2NUMS  3
//#define Z2TYPE  0
//
//
//velVar = 0.02;
//itemCount = 4;
//zOrder = 1;
//itemType = @"SceneItem_";
//randomNums = 0;
//countInSt = 6;
//
//velVar = 0.08;
//itemCount = 2;
//zOrder = 2;
//itemType = @"SceneItem_";
//randomNums = 0;
//countInSt = 7;
//velVar = 0.15;
//itemCount = 2;
//zOrder = 3;
//itemType = @"SceneItem_";
//countInSt = 6;
//velVar = 0.25;
//itemCount = 3;
//zOrder = 4;
//itemType = @"SceneBg_";
//countInSt = 3;
//velVar = 0.4;
//itemCount = 3;
//zOrder = 5;
//itemType = @"SceneBg_";
//countInSt = 4;
//velVar = 0.6;
//itemCount = 2;
//zOrder = 6;
//itemType = @"SceneItem_";
//countInSt = 3;
//velVar = 1;
//itemCount = 2;
//zOrder = 7;
//itemType = @"SceneBg_";
//velVar = 1;
//itemCount = 2;
//zOrder = 8;
//itemType = @"SceneItem_";
//countInSt = 2;
//velVar = 2;
//itemCount = 1;
//zOrder = 9;
//itemType = @"SceneItem_";
//countInSt = 1;



@interface SpriteE:CCSprite
{
    float _realInterval;
    BOOL  _isJumped;
    int _jumpCount;
}
@property float realInterval;
@property BOOL isJumped;
@property int jumpCount;
@end
@implementation SpriteE
@end



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
+ (NSInteger)createRandomsizeValueInt:(NSInteger)fromInt toInt:(NSInteger)toInt
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
+ (double)createRandomsizeValueFloat:(double)fromFloat toFloat:(double)toFloat
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
        
        diff = 0;
        qsCount = 1;
        [self initBg];
        [self initAnimation];
        [self initRole];
        [self initControl];
        [self initQuestion];
	}
	return self;
}
-(void)initBg
{
    
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_0.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_1.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_2.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_3.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_4.plist"];
    
    _purSpeed = FirstSpeed;
    CCSprite *bg = [CCSprite spriteWithFile:@"sheep_scene_bg.pvr.ccz"];//z0
    bg.anchorPoint = CGPointZero;
    [self addChild:bg z:0];
    
    
    
    
    pNode = [CCParallaxNode node];
    [self addChild:pNode z:0];
    
    for (int i = 0; i < 8; i++) {
        parArr[i] = [[parallaxArr alloc] init];
    }
    
    SpriteE *itemTmp;
    float velVar;
    int itemCount;
    int zOrder;
    int countInSt;
    NSString *itemType;
    int randomNums ;
        
    /*---------------------------------------------z1 setting-------------------------------*/
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
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        parArr[zOrder-1].totalInterval += realInterval;
        
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    /*---------------------------------------------z2 setting-------------------------------*/
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
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        parArr[zOrder-1].totalInterval += realInterval;
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    /*---------------------------------------------z3 setting-------------------------------*/
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
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        parArr[zOrder-1].totalInterval += realInterval;
        
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    /*---------------------------------------------z4 setting-------------------------------*/
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
    
    /*---------------------------------------------z5 setting-------------------------------*/
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
    /*---------------------------------------------z6 setting-------------------------------*/
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
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        parArr[zOrder-1].totalInterval += realInterval;
        
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];

        if (i == countInSt-1) {
            
            parArr[zOrder-1].mostX = itemTmp.position;
            
        }
    }
    /*---------------------------------------------z7 setting-------------------------------*/
    velVar = 1;
    itemCount = 2;
    zOrder = 7;
    itemType = @"SceneBg_";
    for (int i = 0; i < itemCount; i++) {
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, 384)];
    }
    /*---------------------------------------------z8 setting-------------------------------*/
    
    
    
    velVar = 1;
    itemCount = 2;
    zOrder = 8;
    itemType = @"SceneItem_";
    countInSt = 6;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 1500;
    parArr[zOrder-1].itemIntervalMax = 3000;
    parArr[zOrder-1].showZoneYMin = 117;
    parArr[zOrder-1].showZoneYMax = 117;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        parArr[zOrder-1].totalInterval += realInterval;
        
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }
    
    /*---------------------------------------------z9 setting-------------------------------*/
   /* velVar = 2;
    itemCount = 1;
    zOrder = 9;
    itemType = @"SceneItem_";
    countInSt = 1;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 1024;
    parArr[zOrder-1].itemIntervalMax = 3000;
    parArr[zOrder-1].showZoneYMin = 110;
    parArr[zOrder-1].showZoneYMax = 110;
    
    for (int i = 0; i < countInSt; i++) {
        randomNums = [GameScene createRandomsizeValueInt:0 toInt:itemCount-1];
        itemTmp = [SpriteE spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,randomNums]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        float realInterval = [GameScene createRandomsizeValueFloat: parArr[zOrder-1].itemIntervalMin toFloat:parArr[zOrder-1].itemIntervalMax];
        itemTmp.realInterval = realInterval;
        
        parArr[zOrder-1].totalInterval += realInterval;
        
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:
         ccp(itemTmp.contentSize.width/2 +parArr[zOrder-1].totalInterval,[GameScene createRandomsizeValueFloat:parArr[zOrder-1].showZoneYMin toFloat:parArr[zOrder-1].showZoneYMax]) ];
        if (i == countInSt-1) {
            parArr[zOrder-1].mostX = itemTmp.position;
        }
    }*/
    
    
    CCSprite *frontGround = [CCSprite spriteWithSpriteFrameName:@"Z9SceneItem_0"];
    frontGround.position = ccp(420,110);
    [self addChild:frontGround z:2 tag:1001];
    
    
    
    
    [self scheduleUpdate];

}
-(void)initAnimation
{
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_role_ani.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
    

    NSMutableArray *animFrames = [NSMutableArray array];
    CCAnimationCache *aniCache = [CCAnimationCache sharedAnimationCache];
    for(int i = 2; i <= 5; i++) {
        
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_run_%d",i]];
        [animFrames addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.09f];
    
    // Add an animation to the Cache
    [[CCAnimationCache sharedAnimationCache] addAnimation:animation name:@"catcher_run"];
    animation.restoreOriginalFrame = YES;
    [animFrames removeAllObjects];
    
    for(int i = 2; i <= 5; i++) {
        
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_run_back_%d",i]];
        [animFrames addObject:frame];
    }
    
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
    animation.restoreOriginalFrame = YES;
    // Add an animation to the Cache
    [[CCAnimationCache sharedAnimationCache] addAnimation:animation name:@"catcher_run_back"];
    [animFrames removeAllObjects];
    
    
    for(int i = 2; i <= 8; i++) {
        
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_jump_%d",i]];
        [animFrames addObject:frame];
    }
    
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
    animation.restoreOriginalFrame = YES;
    // Add an animation to the Cache
    [[CCAnimationCache sharedAnimationCache] addAnimation:animation name:@"catcher_jump"];
    [animFrames removeAllObjects];
    
    
    for(int i = 2; i <= 8; i++) {
        
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_jump_back_%d",i]];
        [animFrames addObject:frame];
    }
    
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
    animation.restoreOriginalFrame = YES;
    // Add an animation to the Cache
    [[CCAnimationCache sharedAnimationCache] addAnimation:animation name:@"catcher_jump_back"];
    [animFrames removeAllObjects];
       
    
    
    for(int i = 2; i <= 4; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_role_run_%d",i]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
    // Add an animation to the Cache
    [aniCache addAnimation:animation name:@"role_run"];
    animation.restoreOriginalFrame = YES;
    [animFrames removeAllObjects];
    
    
    for(int i = 2; i <= 8; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_role_jump_%d",i]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.11f];
    animation.restoreOriginalFrame = YES;
    [animFrames removeAllObjects];
    // Add an animation to the Cache
    [aniCache addAnimation:animation name:@"role_jump"];
    
    for(int i = 2; i <= 8; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_role_fall_%d",i]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.11f];
    animation.restoreOriginalFrame = YES;
    [animFrames removeAllObjects];
    // Add an animation to the Cache
    [aniCache addAnimation:animation name:@"role_fall"];
    
    
    for(int i = 2; i <= 4; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_role_scare_%d",i]];
        [animFrames addObject:frame];
    }
    animation = [CCAnimation animationWithSpriteFrames:animFrames delay:0.11f];
    animation.restoreOriginalFrame = YES;
    [animFrames removeAllObjects];
    // Add an animation to the Cache
    [aniCache addAnimation:animation name:@"role_scare"];
    
    //drop0
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_2"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_2"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_3"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_4"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop0_5"]];
        animation1.restoreOriginalFrame = NO;
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop0"];
    }
    
    //drop1
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop1_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop1_2"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop1_3"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop1_4"]];
        animation1.restoreOriginalFrame = NO;
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop1"];
    }
    
    //drop2_1
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_2"]];
        animation1.restoreOriginalFrame = NO;
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop2_1"];
    }
     //drop2_2
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_3"] delayUnits:1 userInfo:nil]];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_3"] delayUnits:1 userInfo:nil]];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_4"] delayUnits:1 userInfo:nil]];
        animation1.restoreOriginalFrame = NO;
        animation1 = [CCAnimation animationWithAnimationFrames:animFrames delayPerUnit:0.1 loops:3];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop2_2"];
    }
    
    //drop3_1
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_2"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_2"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_3"]];
        animation1.restoreOriginalFrame = NO;
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop3_1"];
    }
    
    //drop3_2
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_4"] delayUnits:1 userInfo:nil]];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_5"] delayUnits:1 userInfo:nil]];
        animation1.restoreOriginalFrame = NO;
        animation1 =[CCAnimation animationWithAnimationFrames:animFrames delayPerUnit:0.1 loops:3];
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop3_2"];
    }
    
    
    
}
-(void)initRole
{
    arr_catcher = [NSMutableArray arrayWithCapacity:20];
    
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_role_ani.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
    
    Buff = [CCSprite spriteWithSpriteFrameName:@"s_catcher_speedUp_buffer"];
    Buff.opacity = 0;
    Buff.position = ccp(Buff.contentSize.width/2,457);
    [self addChild:Buff z:1];
#pragma catcher init

    for (int i = 0 ; i < 11; i++) {
        Catcher *catcher ;
        if (i<4){
            //animation = [aniCache animationByName:@"catcher_run_back"];
            catcher = [[Catcher alloc ] initWithFrameName:@"s_catcher_run_back_1" Delay:[GameScene createRandomsizeValueFloat:0.05 toFloat:0.3]];
            catcher.isBack = YES;
        }
        else
        {
             catcher = [[Catcher alloc ] initWithFrameName:@"s_catcher_run_1" Delay:[GameScene createRandomsizeValueFloat:0.05 toFloat:0.3]];
            //catcher.isBack = NO;
        }
        [catcher initAnimation];
        [self addChild:catcher z:1];
        catcher.delegate = self;
        [arr_catcher addObject:catcher];
        switch (i) {
            case 0:
                catcher.position = ccp(115,256);
                break;
            case 1:
                catcher.position = ccp(285,262);
                break;
            case 2:
                catcher.position = ccp(394,254);
                break;
            case 3:
                catcher.position = ccp(502.6,247.6);
                break;
            case 4:
                catcher.position = ccp(359,200);
                break;
            case 5:
                catcher.position = ccp(631,222);
                break;
            case 6:
                catcher.position = ccp(542,197.8);
                break;
            case 7:
                catcher.position = ccp(474,166);
                break;
            case 8:
                catcher.position = ccp(207,216);
                break;
            case 9:
                catcher.position = ccp(82.4,176.4);
                break;
            case 10:
                catcher.position = ccp(250,162);
                break;
        }
    }
    for (Catcher *cat in arr_catcher) {
        cat.position = ccpAdd(cat.position, ccp(0, -20));
    }
    
    /*arr_catcher = (NSMutableArray*)[arr_catcher sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        if (((Catcher*)obj1).position.x < ((Catcher*)obj2).position.x) {
            
            return (NSComparisonResult)NSOrderedDescending;
            
        }
        
        if (((Catcher*)obj1).position.x > ((Catcher*)obj2).position.x) {
            
            return (NSComparisonResult)NSOrderedAscending;
            
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];*/
    
    
    
    CCMenuItemFont *item1 = [CCMenuItemFont itemWithString:@"+" block:^(id sender){_purSpeed -=100;}];
    CCMenuItemFont *item2 = [CCMenuItemFont itemWithString:@"-" block:^(id sender){_purSpeed +=100;}];
    
    CCMenuItemFont *item3 = [CCMenuItemFont itemWithString:@"Drop" block:^(id sender){
        [self dropOneCatcher];
    }];
    CCMenuItemFont *item4 = [CCMenuItemFont itemWithString:@"SpeedUp" block:^(id sender){
        [self speedUpCatcher];
    }];
    item1.fontSize = 60;
    item2.fontSize = 60;
    item3.fontSize = 60;
    item4.fontSize = 60;
    item1.position = ccp(50,720);
    item2.position = ccp(100,720);
    item3.position = ccp(200,720);
    item4.position = ccp(300,720);
    CCMenu *menu = [CCMenu menuWithItems:item1,item2, item3,item4,nil];
    [self addChild:menu z:4];
    menu.position=CGPointZero;
    
    
    
    //CCSprite *spr = (CCSprite*)[arr_catcher objectAtIndex:0];
    //[pNode set]
    //[spr runAction:[CCMoveBy actionWithDuration:10 position:CGPointMake(5000, 0)]];
    
    
    
#pragma role init
    
    
   
    
    role = [[Role alloc] initWithFrameName:@"s_role_run_1"];
    [self addChild:role z:1];
    role.position = ccp(877,279);
    [role initAnimation];
    //[self schedule:@selector(roleJump:) interval:3];
    //[self schedule:@selector(speedUpCatcher) interval:2];
    //[self schedule:@selector(catcherJump:) interval:2];
    role.delegate = self;
    
}
-(void)initControl
{
    _GameLife = 4;
    for (int i = 0 ; i < 4; i++) {
        life[i] = [CCSprite spriteWithSpriteFrameName:@"life"];
        life[i].scale = 1;
        [self addChild:life[i] z:4];
        life[i].position = ccp(700+i*life[i].contentSize.width*1.1,768-life[i].contentSize.height/2.2);
    }
        
}
//about role,background Items move refresh
- (void)update:(ccTime)delta
{
    
    for (Catcher* tmp in arr_catcher) {
        if (tmp.isDrop) {
            tmp.position = ccpAdd(tmp.position, ccpMult(ccp(tmp.val, 0), delta));
            if (tmp.position.x < - tmp.contentSize.width/2-50) {
                [arr_catcher removeObject:tmp];
                [self removeChild:tmp cleanup:YES];
                break;
                //[arr_droped removeObject:tmp];
            }
        }
    }
    
    
    /*---------------background moved---------------*/
    CCSprite *frontGround = (CCSprite*)[self getChildByTag:1001];
    frontGround.position = ccpAdd(frontGround.position, ccpMult(ccp(_purSpeed*FrontGroundRadio, 0), delta));
    if (frontGround.position.x < -frontGround.contentSize.width/2-5) {
        frontGround.position =ccp([GameScene createRandomsizeValueFloat:3300 toFloat:4500],frontGround.position.y);
    }
    
    parallaxArr *par;
    pNode.position = ccpAdd(pNode.position, ccpMult(ccp(_purSpeed, 0), delta));
    for (int i = 0 ; i < 8; i++) {
        par = parArr[i];
        
        SpriteE *tmpSp;
        CCARRAY_FOREACH(par.arr, tmpSp)
        {
            float  curX = [pNode convertToWorldSpace:tmpSp.position].x ;
            
            //float  deltaX = curX + back.contentSize.width/2;
            if (curX< -tmpSp.contentSize.width/2-5) {
                if (par.isRandom == NO) {//IS background
                    
                    [pNode incrementOffset:ccp(tmpSp.contentSize.width* [par.arr count] ,0) forChild:tmpSp];
                }
                else                    //is bg items
                {
                    float realInterval = [GameScene createRandomsizeValueFloat: par.itemIntervalMin toFloat:par.itemIntervalMax];
                    par.totalInterval += realInterval;
                    par.totalInterval -= tmpSp.realInterval;
                    tmpSp.realInterval = realInterval;
                    tmpSp.isJumped = NO;
                    
                    [pNode incrementOffset:ccp(par.totalInterval,0) forChild:tmpSp];
                    //NSLog(@"real=%f,total=%f",realInterval,par.totalInterval);
                }
            }
        }
    }
    
    /* jumpFunction
     CCArray *jumpObjArr = parArr[7].arr;
     for (SpriteE *tmp in jumpObjArr) {
     CGPoint jmpObjPos = [pNode convertToWorldSpace:tmp.position];
     //CCLOG(@"jump%f",jmpObjPos.x);
     for (Catcher *catcher in arr_catcher) {
     if (catcher.position.x>jmpObjPos.x+200 && tmp.jumpCount <= [arr_catcher count]) {
     [catcher Jump:0];
     
     }
     }
     }*/
    
    
}
-(void)initQuestion
{

    if (qsCount>10) {
        [self gameWin];
    }
    
    for (int i =0; i <3; i++) {
        for (int j = 0 ; j < 10; j++ ) {
            availablePL[i][j] = YES;
        }
    }
    
    for (int i =0; i <2; i++) {
        for (int j = 0 ; j < 8; j++ ) {
            availablePL[i][j] = YES;
        }
    }
    
    for (int i =0; i <3; i++) {
        for (int j = 0 ; j < 19; j++ ) {
            availablePL[i][j] = YES;
        }
    }
    
    int type = [GameScene createRandomsizeValueInt:0 toInt:2];
    type = 0;
    int index;   

    switch (type) {
        case 0:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:1];
            index = [GameScene createRandomsizeValueInt:0 toInt:9];
             _qsLayer = [[QuestionPL alloc] initWithDiff:diff Type:type Index:index];
        }
            break;
        case 1:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:2];
            index = [GameScene createRandomsizeValueInt:0 toInt:9];
            _qsLayer = [[QuestionPL alloc] initWithDiff:diff Type:type Index:index];
        }
             
            break;
        case 2:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:2];
            index = [GameScene createRandomsizeValueInt:0 toInt:9];
            _qsLayer = [[QuestionPL alloc] initWithDiff:diff Type:type Index:index];
        }
            break;
    }
       
    [self addChild:_qsLayer z:3];
    _qsLayer.position = ccp(0,0);
    _qsLayer.delegate = self;
}
-(void)RoleAnimationDidFinished
{
    
}
-(void)CatcherAnimationDidFinished:(id)sender WithType:(int)tpye//多只羊
{
    
    Catcher *tmpCatch = (Catcher*)sender;
    [tmpCatch setBlurSize:0];
    //_purSpeed = -500;
    [tmpCatch Run];
    [tmpCatch runAction:[CCMoveBy actionWithDuration:2.0 position:ccp(-100, 0)]];
    [Buff runAction:[CCFadeOut actionWithDuration:0.5]];
    [self schedule:@selector(speedNormal) interval:0];
    
}
-(void)CatcherDropDidFinished:(id)sender WithType:(int)tpye
{
    Catcher *tmpCatch = (Catcher*)sender;
    _purSpeed = FirstSpeed;
    tmpCatch.val = _purSpeed;
    for (Catcher *tmp in arr_catcher) {
        [tmp resumeSchedulerAndActions];
    }
    [self nextQuestion];
}
-(void)speedNormal
{
    if (_purSpeed  > FirstSpeed) {
        _purSpeed = FirstSpeed;
        [self unschedule:_cmd];
    }
    else
    {
       _purSpeed += 40;
    }
}
-(void)speedUpCatcher
{
    //[self schedule:_cmd interval:8];
    int speedUpType = [GameScene createRandomsizeValueInt:0 toInt:1];
    for (Catcher *catcher in arr_catcher )
    {
        //[catcher Jump:[arr_catcher indexOfObject:catcher]*0.05];
        [catcher speedUp:speedUpType];
        
        [catcher runAction:[CCMoveBy actionWithDuration:1 position:ccp(100, 0)]];
        
        [catcher setBlurSize:1.0];
    }
    [Buff runAction:[CCFadeIn actionWithDuration:0.2]];
    _purSpeed = -6000;
}
-(void)dropOneCatcher
{
    _purSpeed = 0;
    for (Catcher *tmp in arr_catcher) {
        [tmp pauseSchedulerAndActions];
    }
    int tmpIndex = [GameScene createRandomsizeValueInt:0 toInt:[arr_catcher count]-1];
    Catcher *tmpCatch = (Catcher*)[arr_catcher objectAtIndex:tmpIndex];
    if (!tmpCatch.isDrop) {
        
        [tmpCatch drop];
    }
    //[arr_catcher removeObject:tmpCatch];


    
}

#pragma question Delegate

-(void)answerJudgeFinished:(id)sender isCorrect:(BOOL)isCorrect
{
    if (isCorrect) {
        [self dropOneCatcher];
    }
    [self removeChild:_qsLayer cleanup:YES];
    
}
-(void)answerJudgeBegin:(id)sender isCorrect:(BOOL)isCorrect
{
    ++qsCount;
    
    if ( qsCount>8 ) {
        diff = 2;
    }
    else if(qsCount>5)
    {
        diff = 1;
    }
    else
    {
        diff = 0;
    }
    
    
    if (!isCorrect)    //错误掉血
    {
        --_GameLife;
        [life[_GameLife] runAction:[CCSequence actions:[CCCallBlock actionWithBlock:^{
            [life[_GameLife] setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"life_ani"]];
        }],[CCScaleTo actionWithDuration:0.2 scale:0],[CCCallBlock actionWithBlock:^{
            [self removeChild:life[_GameLife] cleanup:YES];
        }], nil]];
        
        if (_GameLife>=0) {//还有命~继续
            [self speedUpCatcher];//动物狂追
            [self schedule:@selector(nextQuestion) interval:3.5];
        }
        else//没命~gameover
            [self gameOver];
    }
    else
        rightCount++;
    

}
-(void)nextQuestion
{
    CCLOG(@"nextQs");
    [self unschedule:_cmd];
    [self initQuestion];
}
-(void)gameWin
{
    CCLOG(@"GameWin");
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameOverScene sceneWin:rightCount]]];
}
-(void)gameOver
{
    //[[CCDirector sharedDirector] ]
    CCLOG(@"GameOver");
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameOverScene sceneGameOver:rightCount]]];
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    //[super dealloc];
    //[parallaxArr release];
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	//[super dealloc];
}

@end
