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
    float itemInterval;
}
@property (assign,nonatomic) int zOrder;
@property (assign,nonatomic) BOOL isRandom;
@property (assign,nonatomic) float itemInterval;
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
