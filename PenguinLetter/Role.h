//
//  Role.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@protocol RoleDelegate

-(void)RoleAnimationDidFinished;
-(void)CatcherAnimationDidFinished:(id)sender WithType:(int)tpye;
@end


@interface SpriteBlur : CCSprite
{
	CGPoint blur_;
	GLfloat	sub_[4];
    
	GLuint	blurLocation;
	GLuint	subLocation;
}

-(void) setBlurSize:(CGFloat)f;
@end

@interface Role : SpriteBlur {
    float _val;
    float _delayTime;
    float _deltaDis;
    int _aniCount[4];
    CCAnimationCache *aniCache;
    id _acRun;
    id _acJump;
    id _acFall;
    id _acScare;
    BOOL _canAction;
    BOOL _isJumping;
    CCSprite *face;
    NSObject <RoleDelegate> *_delegate;
}
@property (readwrite, nonatomic) NSObject *delegate;
-(void)initAnimation;
-(id)initWithFrameName:(NSString*)frameName;//AniCount:(int[4])count;
-(void)Jump;
-(void)Run;
-(void)Scare;
-(void)Fall;
-(void)remove;
//-(id)initWithRole:(CCAnimate *)
-(void)faceGood;
-(void)faceBad;
@end



@interface Catcher : Role
{
    id acDrop[2];
    id acSpeedUp[2];
    
    //CCAnimate *
}
-(id)initWithFrameName:(NSString*)frameName Delay:(float)time;
-(void)speedUp:(int)a;
-(void)speedDown;
-(void)drop;
-(void)Jump:(float)delay;
@end

@interface Catcher()
@property (readwrite,assign) BOOL isBack;

@end