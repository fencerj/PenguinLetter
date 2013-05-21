//
//  Role.m
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "Role.h"


@implementation Role
-(id)initWithFrameName:(NSString*)frameName Delay:(float)time // AniCount:(int[4])count
{
    //    _aniCount[0] = count[0];
//    _aniCount[1] = count[1];
//    _aniCount[2] = count[2];
//    _aniCount[3] = count[3];
    _delayTime = time;
    aniCache = [CCAnimationCache sharedAnimationCache];
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
    
    anion = [aniCache animationByName:@"role_Fall"];
    _acFall= [CCAnimate actionWithAnimation:anion];
    [self schedule:@selector(Run) interval:_delayTime];
    
}
-(void)Jump
{
    
    
}
-(void)Run
{
    //role.position = ccp(877,279);    
    CCAnimation *anion = [aniCache animationByName:@"role_run"];
    CCAnimate *ani = [CCAnimate actionWithAnimation:anion];
    CCAction * a = [CCRepeatForever actionWithAction:ani];
    [self runAction:a];
}
-(void)remove
{
}
@end

@implementation Catcher

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
-(void)Jump
{
    _canAction = NO;
    [self stopAllActions];
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:_delayTime],_acJump,[CCCallBlock actionWithBlock:^{
        [self Run];
    }],nil]];
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