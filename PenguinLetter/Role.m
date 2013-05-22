//
//  Role.m
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "Role.h"


@implementation Role
-(id)initWithFrameName:(NSString*)frameName  // AniCount:(int[4])count
{
    //    _aniCount[0] = count[0];
//    _aniCount[1] = count[1];
//    _aniCount[2] = count[2];
//    _aniCount[3] = count[3];
    aniCache = [CCAnimationCache sharedAnimationCache];
    _canAction = YES;
    return [self initWithSpriteFrameName:frameName];
    
}
-(void)initAnimation
{
    CCAnimation *anion = [aniCache animationByName:@"role_run"];
   
    _acRun = [CCAnimate actionWithAnimation:anion];
    
    anion = [aniCache animationByName:@"role_jump"];
    _acJump = [CCAnimate actionWithAnimation:anion];
    
    anion = [aniCache animationByName:@"role_scare"];
    _acScare= [CCAnimate actionWithAnimation:anion];
    
    anion = [aniCache animationByName:@"role_fall"];
    _acFall= [CCAnimate actionWithAnimation:anion];
    [self schedule:@selector(Run) interval:0];
    
}
-(void)Jump
{
    [self stopAllActions];
    [self runAction:[CCSequence actions:_acJump,[CCCallBlock actionWithBlock:^{
        [self Run];
        //[self schedule:@selector(Run) interval:_delayTime];
    }],nil]];
}
-(void)Run
{
    [self unschedule:_cmd];
    CCActionInterval * a = [CCRepeatForever actionWithAction:_acRun];
    [self runAction:a];
}
-(void)Scare
{
    [self stopAllActions];
    [self runAction:[CCSequence actions:_acScare,[CCCallBlock actionWithBlock:^{
        [self Run];
        //[self schedule:@selector(Run) interval:_delayTime];
    }],nil]];

}
-(void)Fall
{
    [self stopAllActions];
    [self runAction:[CCSequence actions:_acFall,[CCCallBlock actionWithBlock:^{
        [self Run];
        //[self schedule:@selector(Run) interval:_delayTime];
    }],nil]];
    
}
-(void)faceGood
{
    face = [CCSprite spriteWithSpriteFrameName:@"s_role_face_t"];
    [self addChild:face z:1];
    face.position = ccp(face.contentSize.width*1.5,face.contentSize.height*1.5);
    [face runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.2],[CCDelayTime actionWithDuration:0.8],[CCFadeOut actionWithDuration:0.2],nil]];
}
-(void)faceBad
{
    
}
-(void)remove
{
}
@end

@implementation Catcher
-(id)initWithFrameName:(NSString*)frameName  Delay:(float)time// AniCount:(int[4])count
{
    //    _aniCount[0] = count[0];
    //    _aniCount[1] = count[1];
    //    _aniCount[2] = count[2];
    //    _aniCount[3] = count[3];
    _delayTime = time;
    aniCache = [CCAnimationCache sharedAnimationCache];
    _canAction = YES;
    return [self initWithSpriteFrameName:frameName];
    
}
-(void)initAnimation
{
    CCAnimation *anion = [aniCache animationByName:@"catcher_run"];
    if (_userData==(void*)1) {
        anion = [aniCache animationByName:@"catcher_run_back"];
    }
   _acRun = [CCAnimate actionWithAnimation:anion];
    
    anion = [aniCache animationByName:@"catcher_jump"];
    if (_userData==(void*)1) {
        anion = [aniCache animationByName:@"catcher_jump_back"];
    }
    _acJump = [CCAnimate actionWithAnimation:anion];
    
    
    [self schedule:@selector(Run) interval:_delayTime];
}
-(void)Jump:(float)delay
{
    if (!_canAction) {
        return;
    }
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:_delayTime],[CCCallBlock actionWithBlock:^{
        [self stopActionByTag:11];
    }],_acJump,[CCCallBlock actionWithBlock:^{
        [self Run];
        _canAction = YES;
    }],nil]];
    _canAction = NO;
    
    
   /* [self runAction:[CCSequence actions:_acJump,[CCCallBlock actionWithBlock:^{
        [self Run];
        _canAction = YES;
        //[self schedule:@selector(Run) interval:_delayTime];
    }],nil]];*/
    //[self runAction:[CCSequence actionOne:ani two:<#(CCFiniteTimeAction *)#>]]
    //CCAction * a = [CCRepeatForever actionWithAction:ani];
}
-(void)speedUp
{
    
}
-(void)Run
{
    [self unschedule:_cmd];
    CCActionInterval * a = [CCRepeatForever actionWithAction:_acRun];
    [a setTag:11];
    [self runAction:a];
}
-(void)speedDown
{
}
-(void)drop
{
    
}
-(void)remove
{
}
@end