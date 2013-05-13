//
//  GameScene.h
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef struct parallaxArr {
    __unsafe_unretained CCArray *arr;
    int zOrder;
    BOOL isRandom;
}parallaxArr;


@interface GameScene : CCLayer {
    float _purSpeed;    //追赶者速度
    float _sceneSpeed;  //场景移动速度
    float _deltaDis;    //间距
    parallaxArr parArr[7];
}

@end
