//
//  GameOverScene.h
//  PenguinLetter
//
//  Created by IvanMacAir on 13-6-9.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "spine-cocos2d-iphone.h"
#import "Map.h"
@interface GameOverScene : CCLayer {
    CCSkeletonAnimation* animationNode;
    BOOL isWin;
    float time;
    int rightCount;
}
+(id)sceneWin:(int)count;
+(id)sceneGameOver:(int)count;
@end
