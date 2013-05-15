//
//  GameScene.h
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface parallaxArr : NSObject
{
    CCArray *arr;
    int zOrder;
    BOOL isRandom;
    float itemIntervalMin;
    float itemIntervalMax;
    
    float showZoneYMin;
    float showZoneYMax;
}
@property (assign,nonatomic) int zOrder;
@property (assign,nonatomic) BOOL isRandom;
@property (assign,nonatomic) float itemIntervalMin;
@property (assign,nonatomic) float itemIntervalMax;
@property (assign,nonatomic) float showZoneYMin;
@property (assign,nonatomic) float showZoneYMax;
@property (retain,nonatomic) CCArray *arr;
@end



@interface GameScene : CCLayer {
    float _purSpeed;    //追赶者速度
    float _sceneSpeed;  //场景移动速度
    float _deltaDis;    //间距
    parallaxArr *parArr[9];
    CCParallaxNode *pNode;
}
+(CCScene *) scene;
@end
