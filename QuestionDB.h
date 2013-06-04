//
//  QuestionDB.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-16.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol QsDelegate 
-(void)answerIsCorrect:(id)sender;
-(void)answerIsFault:(id)sender;
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


@interface QuestionDB : CCLayer {
    //NSString *_qsName;
    int _qsType;
    NSMutableArray *_qsItemArr;
    NSMutableArray *_ansItemArr;
    int _diff;
    int _ansCount;
    int _qsCount;
    NSString *qsName;
    CCSprite *_qsFrame;
    CCSprite *_ansFrame;    //NSString *itemsName;
    BOOL isAnswered;
    NSObject <QsDelegate> *_delegate;
}
//@property (nonatomic,strong) NSMutableArray *qsItemArr;
//@property (nonatomic,strong) NSMutableArray *ansItemArr;
@property (readwrite, nonatomic) NSObject *delegate;
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