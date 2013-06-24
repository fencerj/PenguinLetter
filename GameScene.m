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

@implementation PauseLayer
-(id)init
{
    self = [super init];
    if (self) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"pause.plist"];
        CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"pausemask"];
        bg.anchorPoint = CGPointZero;
        [self addChild:bg];
        
        CCSprite *logo = [CCSprite spriteWithSpriteFrameName:@"pauseLogo"];
        logo.position = ccp(512,524);
        [self addChild:logo];
        
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"zagain"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"zBagain"] block:^(id sender){
            [[CCDirector sharedDirector] resume];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameScene scene]]];
            
        }];
        
        CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"zditu"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"zBditu"]  block:^(id sender){
            [[CCDirector sharedDirector] resume];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Map scene]]];
        }];
        item1.position = ccp(677.2,286.3);
        item2.position = ccp(313,291.8);
        
        CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"zjixu"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"zBjixu"]  block:^(id sender){
            [[CCDirector sharedDirector] resume];
            [self runAction:[CCSequence actions:[CCCallBlock actionWithBlock:^{
                GameScene *spl = (GameScene*)[self parent];
                spl.isPause = NO;
                
                [self removeFromParentAndCleanup:YES];
            }], nil]];
        }];
        item3.position = ccp(501.5,265.5);
        
        CCMenu *menu = [CCMenu menuWithItems:item1,item2,item3,nil];
        [self addChild:menu z:3];
        menu.position = CGPointZero;
        
    }
    return self;
}

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
-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    CCSprite *cloud = (CCSprite*) [self getChildByTag:2002];
    [cloud runAction:[CCSequence actions:[CCMoveBy actionWithDuration:3 position:ccp(-1800,0)],[CCCallBlock actionWithBlock:^{
        [self removeChild:cloud cleanup:YES];
    }], nil]];
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
        [self initStarCloud];
	}
	return self;
}
-(void)initStarCloud
{
    CCSprite *cloudMask = [CCSprite spriteWithFile:@"starCloudMask.png"];
    cloudMask.position = ccp(cloudMask.contentSize.width/2,cloudMask.contentSize.height/2);
    [self addChild:cloudMask z:10 tag:2002];
    
}
-(void)initBg
{
    
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_0.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_1.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_2.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_3.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_4.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"sheep_scene_bg.plist"];
    
    _purSpeed = FirstSpeed;
    CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"Z0Bg_0"];//z0
    bg.anchorPoint = CGPointZero;
    [self addChild:bg z:0];
    
    CCSprite *bg1 = [CCSprite spriteWithSpriteFrameName:@"Z0Bg_1"];//z0
    bg1.anchorPoint = CGPointZero;
    [self addChild:bg1 z:0];
    
    
    
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
    itemCount = 5;
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
    
    
    /*---------------------------------------------z7 background setting-------------------------------*/
    velVar = 1;
    itemCount = 2;
    zOrder = 7;
    itemType = @"SceneBg_";
    for (int i = 0; i < itemCount; i++) {
        itemTmp = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"Z%d%@%d",zOrder,itemType,i]];
        [parArr[zOrder-1].arr addObject:itemTmp];
        [pNode  addChild:itemTmp z:zOrder parallaxRatio:ccp(velVar, 0) positionOffset:ccp(512+(i)*1024, itemTmp.contentSize.height/2)];
    }
    
   
    /*---------------------------------------------z8 setting-------------------------------*/
    
    
    
    velVar = 1;
    itemCount = 6;
    zOrder = 8;
    itemType = @"SceneItem_";
    countInSt = 8;
    parArr[zOrder-1].zOrder = zOrder;
    parArr[zOrder-1].isRandom = YES;
    parArr[zOrder-1].itemIntervalMin = 800;
    parArr[zOrder-1].itemIntervalMax = 2000;
    parArr[zOrder-1].showZoneYMin = 50;
    parArr[zOrder-1].showZoneYMax = 150;
    
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
    
    
    CCSprite *frontGround0 = [CCSprite spriteWithSpriteFrameName:@"Z9SceneItem_0"];
    frontGround0.position = ccp(420,90);
    [self addChild:frontGround0 z:2 tag:1001];
    
//    CCSprite *frontGround1 = [CCSprite spriteWithSpriteFrameName:@"Z9SceneItem_1"];
//    frontGround1.position = ccp(420,110);
//    [self addChild:frontGround1 z:2 tag:1002];
//    
//    CCSprite *frontGround2 = [CCSprite spriteWithSpriteFrameName:@"Z9SceneItem_2"];
//    frontGround2.position = ccp(420,110);
//    [self addChild:frontGround2 z:2 tag:1003];
//    
//    CCSprite *frontGround3 = [CCSprite spriteWithSpriteFrameName:@"Z9SceneItem_3"];
//    frontGround3.position = ccp(420,110);
//    [self addChild:frontGround3 z:2 tag:1004];
    
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
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        
        animation1.restoreOriginalFrame = NO;
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
        
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        animation1.restoreOriginalFrame = NO;
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop1"];
    }
    
    //drop2_1
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_2"]];
       
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
         animation1.restoreOriginalFrame = NO;
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop2_1"];
    }
     //drop2_2
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_3"] delayUnits:1 userInfo:nil]];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_3"] delayUnits:1 userInfo:nil] ];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop2_4"] delayUnits:1 userInfo:nil]];
       
        animation1 = [CCAnimation animationWithAnimationFrames:animFrames delayPerUnit:0.1 loops:3];
         animation1.restoreOriginalFrame = NO;
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
        
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        animation1.restoreOriginalFrame = NO;
        [animFrames removeAllObjects];
        
        //id a1 = [CCAnimate actionWithAnimation:animation1];
        [[CCAnimationCache sharedAnimationCache] addAnimation:animation1 name:@"s_catcher_drop3_1"];
    }
    
    //drop3_2
    {
        CCAnimation* animation1;
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_4"] delayUnits:1 userInfo:nil]];
        [animFrames addObject:[[CCAnimationFrame alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_drop3_5"] delayUnits:1 userInfo:nil] ];
      
        animation1 =[CCAnimation animationWithAnimationFrames:animFrames delayPerUnit:0.1 loops:3];
          animation1.restoreOriginalFrame = NO;
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
    
#pragma role init
    
    
    
    
    role = [[Role alloc] initWithFrameName:@"s_role_run_1"];
    [self addChild:role z:1];
    role.position = ccp(877,279);
    [role initAnimation];
    //[self schedule:@selector(roleJump:) interval:3];
    //[self schedule:@selector(speedUpCatcher) interval:2];
    //[self schedule:@selector(catcherJump:) interval:2];
    role.delegate = self;
    

#pragma catcher init

    for (int i = 0 ; i < 11; i++) {
        CatcherSheep *catcher ;
        if (i<4){
            //animation = [aniCache animationByName:@"catcher_run_back"];
            catcher = [[CatcherSheep alloc ] initWithFrameName:@"s_catcher_run_back_1" Delay:[GameScene createRandomsizeValueFloat:0.05 toFloat:0.3]];
            catcher.isBack = YES;
        }
        else
        {
             catcher = [[CatcherSheep alloc ] initWithFrameName:@"s_catcher_run_1" Delay:[GameScene createRandomsizeValueFloat:0.05 toFloat:0.3]];
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
    for (CatcherSheep *cat in arr_catcher) {
        cat.position = ccpAdd(cat.position, ccp(0, -20));
    }

    
    CCMenuItemSprite *item = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"pauseButton"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"pauseButton"] block:^(id sender){
        if (!_isPause) {
            CCLOG(@"isPause");
            _isPause = YES;
            PauseLayer *pauseLayer =  [[PauseLayer alloc] init];
            pauseLayer.position = ccp(0,0);
            pauseLayer.opacity = 0;
            [self addChild:pauseLayer z:11];
            [pauseLayer runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.5],[CCCallBlock actionWithBlock:^{
                [[CCDirector sharedDirector] pause];
            }], nil]];
        }
    }];
    item.position=ccp(33.6,736.6);
    CCMenu *menu = [CCMenu menuWithItems:item, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:10];
    //CCSprite *spr = (CCSprite*)[arr_catcher objectAtIndex:0];
    //[pNode set]
    //[spr runAction:[CCMoveBy actionWithDuration:10 position:CGPointMake(5000, 0)]];
    

    
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
    timer+=delta;
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
        
        int i = [GameScene createRandomsizeValueInt:0 toInt:3];
        [frontGround setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"Z9SceneItem_%d",i]]];
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
                    float delta = curX  +tmpSp.contentSize.width/2+5;
                    CCLOG(@"delta  = %f,curX = %f",delta,curX);
                    [pNode incrementOffset:ccp(tmpSp.contentSize.width* [par.arr count],0) forChild:tmpSp];
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
     for (CatcherSheep *catcher in arr_catcher) {
     if (catcher.position.x>jmpObjPos.x+200 && tmp.jumpCount <= [arr_catcher count]) {
     [catcher Jump:0];
     
     }
     }
     }*/
    
    
}
-(void)initQuestion
{

    if (qsCount>10) {
        _isWin = YES;
        //[self gameWin];
         [self schedule:@selector(gameStop)];
        [role runAction:[CCMoveBy actionWithDuration:0.8 position:ccp(500,0)]];
        for (Catcher *ca in arr_catcher) {
            [ca Fall];
        }
        return;
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
    
    int type =[GameScene createRandomsizeValueInt:0 toInt:2];
    type = 2;
    int index;   

    
    switch (type) {
        case 0:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:1];
            index = [GameScene createRandomsizeValueInt:0 toInt:9];
             _qsLayer = [[QuestionPL alloc] initWithDiff:diff Type:type Index:index];
            CCLOG(@"PL Qs");
        }
            break;
        case 1:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:2];
            index = [GameScene createRandomsizeValueInt:0 toInt:7];
            _qsLayer = [[QuestionFF alloc] initWithDiff:diff Type:type Index:index];
            CCLOG(@"FF Qs");
        }
             
            break;
        case 2:
        {
            //diff = [GameScene createRandomsizeValueInt:0 toInt:2];
            index = [GameScene createRandomsizeValueInt:0 toInt:9];
            _qsLayer = [[QuestionOT alloc] initWithDiff:diff Type:type Index:index] ;
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
    
    CatcherSheep *tmpCatch = (CatcherSheep*)sender;
    [tmpCatch setBlurSize:0];
    //_purSpeed = -500;
    //[tmpCatch Run];
    [tmpCatch runAction:[CCMoveBy actionWithDuration:2.0 position:ccp(-100, 0)]];
    [Buff runAction:[CCFadeOut actionWithDuration:0.5]];
    [self schedule:@selector(speedNormal) interval:0];   
    
}
-(void)CatcherDropDidFinished:(id)sender WithType:(int)tpye
{
    CatcherSheep *tmpCatch = (CatcherSheep*)sender;
    _purSpeed = FirstSpeed;
    tmpCatch.val = _purSpeed;
    for (CatcherSheep *tmp in arr_catcher) {
        [tmp resumeSchedulerAndActions];
        tmp.animationNode.timeScale = 1;
    }
    role.animationNode.timeScale = 1;
    [self nextQuestion];
    [role resumeSchedulerAndActions];
}
-(void)speedNormal
{
    if (_purSpeed  > FirstSpeed) {
        _purSpeed = FirstSpeed;
        [role Run];
        [self nextQuestion];
        [self unschedule:_cmd];
    }
    else
    {
       _purSpeed += 80;
    }
}
-(void)speedUpCatcher
{
    //[self schedule:_cmd interval:8];
    int speedUpType = [GameScene createRandomsizeValueInt:0 toInt:1];
    for (CatcherSheep *catcher in arr_catcher )
    {
        //[catcher Jump:[arr_catcher indexOfObject:catcher]*0.05];
        [catcher speedUp:speedUpType];
        
        [catcher runAction:[CCMoveBy actionWithDuration:1 position:ccp(100, 0)]];
        
        [catcher setBlurSize:1.0];
        
    }
    [role Scare];
    [Buff runAction:[CCFadeIn actionWithDuration:0.2]];
    _purSpeed = -6000;
}
-(void)dropOneCatcher:(int)index
{
    _purSpeed = 0;
    role.animationNode.timeScale = 0;
    for (CatcherSheep *tmp in arr_catcher) {
        //[tmp pauseSchedulerAndActions];
        tmp.animationNode.timeScale = 0;
    }
    
    CatcherSheep *tmpCatch = (CatcherSheep*)[arr_catcher objectAtIndex:index];
    if (!tmpCatch.isDrop) {
        [tmpCatch drop:effectId];
    }
    //[arr_catcher removeObject:tmpCatch];
    [role pauseSchedulerAndActions];

    
}

#pragma question Delegate

-(void)answerJudgeFinished:(id)sender isCorrect:(BOOL)isCorrect
{
    
    int effid = [GameScene createRandomsizeValueInt:1 toInt:4];
    int tmpIndex = [GameScene createRandomsizeValueInt:0 toInt:[arr_catcher count]-1];
    if (isCorrect) {
        [self dropOneCatcher:tmpIndex];
        CatcherSheep *tmpCatch = (CatcherSheep*)[arr_catcher objectAtIndex:tmpIndex];
        [(QuestionLayer*)sender correctAnswerAni:effid Pos:tmpCatch.position];
    }
    [self removeChild:_qsLayer cleanup:YES];
    
}
-(void)answerJudgeBegin:(id)sender isCorrect:(BOOL)isCorrect EffectId:(int)efid
{
    effectId = efid;
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
        [role faceBad];
        [role Scare];
        --_GameLife;
        [life[_GameLife] runAction:[CCSequence actions:[CCCallBlock actionWithBlock:^{
            [life[_GameLife] setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"life_ani"]];
        }],[CCScaleTo actionWithDuration:0.2 scale:0],[CCCallBlock actionWithBlock:^{
            [self removeChild:life[_GameLife] cleanup:YES];
        }], nil]];
        if (_GameLife>0) {//还有命~继续
            
            [self speedUpCatcher];//动物狂追
        }
        else//没命~gameover
        {
            [self schedule:@selector(gameStop)];
            [role Fall];
            for (CatcherSheep *ca in arr_catcher) {
                [ca gameOver];
                [ca runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.5],[CCMoveBy actionWithDuration:1.5 position:ccp(1500,0)],nil]];
            }
        }
    }
    else
    {
        rightCount++;
        [role faceGood];
        //[role Jump];
    }
    
    //[self answerJudgeFinished:sender isCorrect:isCorrect];

}
-(void)nextQuestion
{
    CCLOG(@"nextQs");
    [self unschedule:_cmd];
    [self initQuestion];
}
-(void)gameStop
{
    
    if (_purSpeed  > 0) {
        _purSpeed = 0;
        //[role Run];
        [self unschedule:_cmd];
        [self unschedule:@selector(update:)];
        if (_isWin) {
            [self gameWin];
        }
        else
        {
            [self gameOver];
        }
    }
    else
    {
        _purSpeed += 12;
    }
    
}
-(void)gameWin
{
    CCLOG(@"GameWin");
    
    //
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2.5],[CCCallBlock actionWithBlock:^{
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameOverScene sceneWin:rightCount time:timer]]];
    }],nil]];
}
-(void)gameOver
{
    //[[CCDirector sharedDirector] ]
    CCLOG(@"GameOver");
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:3],[CCCallBlock actionWithBlock:^{
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[GameOverScene sceneGameOver:rightCount]]];
    }],nil]];
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
   // [super dealloc];
    //[parallaxArr release];
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	//[super dealloc];
}

@end
