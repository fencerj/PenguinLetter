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
    countInSt = 1;
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
    arr_catcher = [NSMutableArray arrayWithCapacity:20];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_role_ani.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
   
    //NSMutableArray *aniFrames = [NSMutableArray array];
    
#pragma catcher init
    NSMutableArray *animFrames = [NSMutableArray array];
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
    
    CCAnimationCache *aniCache = [CCAnimationCache sharedAnimationCache];
    for (int i = 0 ; i < 11; i++) {
        CCSprite *catcher ;
        if (i<4){
            animation = [aniCache animationByName:@"catcher_run_back"];
            catcher = [CCSprite spriteWithSpriteFrameName:@"s_catcher_run_back_1"];
            catcher.userData = 1;
        }
        else
        {
            animation = [aniCache animationByName:@"catcher_run"];
            catcher = [CCSprite spriteWithSpriteFrameName:@"s_catcher_run_1"];
            catcher.userData = 0;
        }
           
        //CCAnimation *animation = [CCAnimation animationWithSpriteFrames:aniFrames delay:0.2f];
        CCAnimate *ani = [CCAnimate actionWithAnimation:animation];
        CCAction * a = [CCRepeatForever actionWithAction:ani];
        
        [ani setTag:100];
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:[self createRandomsizeValueFloat:0.05 toFloat:0.3]],[CCCallBlock actionWithBlock:^{
            [catcher runAction:a];
        }], nil]];
        //[self addChild:catcher z:3];
        //[animation set]
        [self addChild:catcher z:8 ];
        //catcher.position = ccp([self createRandomsizeValueFloat:48 toFloat:430],[self createRandomsizeValueFloat:132 toFloat:241]);
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
    
    
    CCMenuItemFont *item1 = [CCMenuItemFont itemWithString:@"+" block:^(id sender){_purSpeed -=100;}];
    CCMenuItemFont *item2 = [CCMenuItemFont itemWithString:@"-" block:^(id sender){_purSpeed +=100;}];
    item1.fontSize = 60;
    item2.fontSize = 60;
    item1.position = ccp(50,720);
    item2.position = ccp(100,720);
    
    CCMenu *menu = [CCMenu menuWithItems:item1,item2, nil];
    [self addChild:menu z:4];
    menu.position=CGPointZero;
    
    
    
    //CCSprite *spr = (CCSprite*)[arr_catcher objectAtIndex:0];
    //[pNode set]
    //[spr runAction:[CCMoveBy actionWithDuration:10 position:CGPointMake(5000, 0)]];
    
    
    
#pragma role init
    
    
    
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
    role = [CCSprite spriteWithSpriteFrameName:@"s_role_run_1"];
    [self addChild:role z:3];
    role.position = ccp(877,279);
    CCAnimation *anion = [aniCache animationByName:@"role_run"];
    CCAnimate *ani = [CCAnimate actionWithAnimation:anion];
    CCAction * a = [CCRepeatForever actionWithAction:ani];
    [role runAction:a];
    
    [self schedule:@selector(roleJump:) interval:3];
    [self schedule:@selector(catcherJump:) interval:2];
    
    
}
-(void)roleJump:(ccTime)dt
{
    [role stopAllActions];
    CCAnimation *ac = [[CCAnimationCache sharedAnimationCache] animationByName:@"role_jump"];
    CCAnimate *ani = [CCAnimate actionWithAnimation:ac];
    
    CCAnimationCache *aniCache =  [CCAnimationCache sharedAnimationCache];
    CCAnimation *a1= [aniCache animationByName:@"role_run"];
    CCAnimate *a2 = [CCAnimate actionWithAnimation:a1];
    CCAction * aa = [CCRepeatForever actionWithAction:a2];
    
    [role runAction:[CCSequence actionOne:ani two:[CCCallBlock actionWithBlock:^{
        [role runAction:aa];
    }]]];
}

-(void)catcherJump:(ccTime)dt
{
    
    CCAnimationCache *aniCache =  [CCAnimationCache sharedAnimationCache];
    for (CCSprite *catcher in arr_catcher )
    {
        [catcher stopAllActions];
        CCAnimation *ac = [[CCAnimationCache sharedAnimationCache] animationByName:@"catcher_jump"];
        if (catcher.userData==(void*)1) {
            ac =[aniCache animationByName:@"catcher_jump_back"];
        }
        CCAnimate *ani = [CCAnimate actionWithAnimation:ac];
        
        CCAnimation *a1 = [aniCache animationByName:@"catcher_run"];
        if (catcher.userData==(void*)1) {
           a1 = [aniCache animationByName:@"catcher_run_back"];
        }
        
        CCAnimate *a2 = [CCAnimate actionWithAnimation:a1];
        CCAction * aa = [CCRepeatForever actionWithAction:a2];
        
        [catcher runAction:[CCSequence actionOne:ani two:[CCCallBlock actionWithBlock:^{
            [catcher runAction:aa];
        }]]];
    }
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
                    [pNode incrementOffset:ccp(back.contentSize.width* [par.arr count] ,0) forChild:back];
                }
                else
                {
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
