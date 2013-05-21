//
//  Role.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Role : CCSprite {
    float _val;
    float _delayTime;
    float _deltaDis;
    int _aniCount[4];
    CCAnimationCache *aniCache;
    CCAnimate *_acRun;
    CCAnimate *_acJump;
    CCAnimate *_acFall;
    CCAnimate *_acScare;
    BOOL _canAction;
    BOOL _isJumping;
}
-(void)initAnimation;
-(id)initWithFrameName:(NSString*)frameName Delay:(float)time; //AniCount:(int[4])count;
-(void)Jump;
-(void)Run;
-(void)remove;
//-(id)initWithRole:(CCAnimate *)
@end

@interface Catcher : Role
{
    CCAnimate *acDrop;
    CCAnimate *acSpeedUp;
    //CCAnimate *
}

-(void)speedUp;
-(void)speedDown;
-(void)drop;
@end