//
//  Role.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "spine-cocos2d-iphone.h"
@protocol RoleDelegate

-(void)RoleAnimationDidFinished;
-(void)CatcherAnimationDidFinished:(id)sender WithType:(int)tpye;
-(void)CatcherDropDidFinished:(id)sender WithType:(int)tpye;
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
    NSString *_acRun;
    NSString *_acJump;
    NSString *_acFall;
    NSString *_acScare;
    BOOL _canAction;
    BOOL _isJumping;
    CCSprite *face;
    NSObject <RoleDelegate> *_delegate;
    CCSkeletonAnimation *animationNode;
}
@property (nonatomic,assign) float delayTime;
@property (readwrite, nonatomic) NSObject *delegate;
@property (nonatomic,assign) float val;
@property (strong,nonatomic) CCSkeletonAnimation *animationNode;
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
    CCAnimate *acDrop[4];
    id acSpeedUp[2];
    NSString *_acDropStr[4];
    NSString *_acSpeedUpStr[2];
    NSString *_acRunStr;
    NSString *_acJumpStr;
    BOOL _isDrop;
    BOOL _isBack;
}
@property (nonatomic,assign) BOOL isDrop;
@property (readwrite,assign) BOOL isBack;
-(id)initWithFrameName:(NSString*)frameName Delay:(float)time;
-(void)speedUp:(int)a;
-(void)speedDown;
-(void)drop:(int)efid;
-(void)Jump:(float)delay;

-(void)gameOver;
@end



@interface CatcherSheep : Catcher
{

    
}
@end
@interface CatcherHorse : Catcher
{
    
    
}
@end