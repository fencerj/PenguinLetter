//
//  QuestionDB.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-16.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface QuestionDB : CCNode
{
    BOOL isUsed;
    NSMutableArray *qsItemStrs;
}
@property (strong,nonatomic) NSMutableArray *qsItemStrs;
@property (assign,nonatomic) BOOL isUsed;
@end


@protocol QsDelegate 
-(void)answerIsCorrect:(id)sender;
-(void)answerIsFault:(id)sender;
-(void)answerJudgeFinished:(id)sender isCorrect:(BOOL)isCorrect;
-(void)answerJudgeBegin:(id)sender isCorrect:(BOOL)isCorrect EffectId:(int)efid;
@end
//NSString *questions[3][10];

@interface AnsItem : CCSprite
{
    NSString *_itemNames;
    BOOL _isCorrect;
}
@property (strong,nonatomic) NSString *itemNames;
@property (assign,nonatomic) BOOL isCorrect;
@end


@interface QuestionLayer : CCLayer {
    //NSString *_qsName;
    int _qsType;
    NSMutableArray *_qsItemArr;
    NSMutableArray *_ansItemArr;
    NSMutableArray *_availbleQs;
    int _diff;
    int _ansCount;
    int _qsCount;
    NSString *qsName;
    CCSprite *_qsFrame;
    CCSprite *_ansFrame;    //NSString *itemsName;
    BOOL isAnswered;
    NSObject <QsDelegate> *_delegate;
    BOOL _isCorrect;
}
//@property (nonatomic,strong) NSMutableArray *qsItemArr;
//@property (nonatomic,strong) NSMutableArray *ansItemArr;
@property (readwrite, nonatomic) NSObject *delegate;
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index;
-(void)correctAnswerAni:(int)effetid Pos:(CGPoint)pos;
-(void)showQuestion;
-(void)nextQuestion;
@end

@interface QuestionPL : QuestionLayer
{
    int qsIndex;
    int ansIndex;
    CCSprite *realQs;
    CCSprite *realAnswer;
    NSString *ansStr;
}
@end

@interface QuestionFF : QuestionLayer
{
    int qsIndex;
    int ansIndex;
    CCSprite *realQs;
    CCSprite *realAnswer;
    NSString *ansStr;
}
@end

@interface QuestionOT : QuestionLayer
{
    int qsIndex;
    int ansIndex;
    CCSprite *realQs;
    CCSprite *realAnswer;
    NSString *ansStr;
}
@end




