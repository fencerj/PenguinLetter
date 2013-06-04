//
//  GameScene.h
//  PenguinLetter
//
//  Created by IvanMacAir on 13-5-13.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Role.h"
#import "QuestionDB.h"

typedef struct StrArr
{
    
}StrArr;

@interface parallaxArr : NSObject
{
    CCArray *arr;//sprite array in one zOrder
    int zOrder;
    BOOL isRandom;
    float itemIntervalMin;
    float itemIntervalMax;
    
    float showZoneYMin;
    float showZoneYMax;
    CGPoint mostX;
    float _totalInterval;
    
}
@property (assign,nonatomic) int zOrder;
@property (assign,nonatomic) BOOL isRandom;
@property (assign,nonatomic) CGPoint mostX;
@property (assign,nonatomic) float itemIntervalMin;
@property (assign,nonatomic) float itemIntervalMax;
@property (assign,nonatomic) float showZoneYMin;
@property (assign,nonatomic) float showZoneYMax;
@property (assign,nonatomic) float totalInterval;
@property (retain,nonatomic) CCArray *arr;
@end



@interface GameScene : CCLayer<RoleDelegate,QsDelegate> {
    float _purSpeed;    //追赶者速度
    float _sceneSpeed;  //场景移动速度
    float _deltaDis;    //间距
    float _movedLong;
    parallaxArr *parArr[8];//levels array --total 9 levels
    CCParallaxNode *pNode;
    NSMutableArray *arr_catcher;
    NSMutableArray *arr_droped;
    Role *role;
    NSMutableArray *arr_jumpItem;
    CCSprite *Buff;
    QuestionPL *_qsLayer;
}
+ (NSInteger)createRandomsizeValueInt:(NSInteger)fromInt toInt:(NSInteger)toInt;
+ (double)createRandomsizeValueFloat:(double)fromFloat toFloat:(double)toFloat;
+(CCScene *) scene;
@end
