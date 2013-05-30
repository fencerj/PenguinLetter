//
//  QuestionDB.h
//  PenguinLetter
//
//  Created by Ivan on 13-5-16.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface QuestionDB : CCNode {
    NSString *qsName;
    NSInteger qsType;
    NSMutableArray *qsItemArr;
    NSMutableArray *ansItemArr;
    int ansCount;
    int qsCount;
    
    //NSString *itemsName;
}
-(void)showQuestion;
-(void)showAnswer;
-(BOOL)judgeAnswer:(int)youChose;
@end
