//
//  QuestionDB.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-16.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

//NSString *questions[3][10];

typedef struct QData
{
    int index;
    int diff;
    int type;
    NSMutableArray *qsItemsArr;
    NSMutableArray *asItemArr;
    
}QData;

QData qd[3][10];

@interface QuestionDB : CCLayer {
    //NSString *_qsName;
    int _qsType;
    NSMutableArray *_qsItemArr;
    NSMutableArray *_ansItemArr;
    int _diff;
    int _ansCount;
    int _qsCount;
    CCSprite *_qsFrame;
    CCSprite *_ansFrame;    //NSString *itemsName;
    BOOL isAnswered;
}
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index;
-(void)showQuestion;

@end

@interface QuestionPL : QuestionDB
{
    int qsIndex;
    int ansIndex;
    CCSprite *realQs;
    CCSprite *realAnswer;
    NSString *ansStr;
}
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index ;
@end




@interface QuestionLayer : CCLayer


@end