//
//  QuestionDB.m
//  PenguinLetter
//
//  Created by Ivan on 13-5-16.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "QuestionDB.h"
#import "GameScene.h"
NSString *qsPLData[3][10][3] =
{
    {
        {
            @"S1",
            @"S2"
        },
        {
            @"S1",
            @"S3"
        },
        {
            @"S1",
            @"S4"
        },
        {
            @"S1",
            @"S5"
        },
        {
            @"S2",
            @"S4"
        },
        {
            @"S1",
            @"S6"
        },
        {
            @"S5",
            @"S6"
        },
        {
            @"S6",
            @"S3"
        },
        {
            @"S4",
            @"S3"
        },
        {
            @"S4",
            @"S6"
        },
    },
    {
        {
            @"S1",
            @"S1",
            @"S2",
        },
        {
            @"S1",
            @"S1",
            @"S3",
        },
        {
            @"S1",
            @"S4",
            @"S4",
        },
        {
            @"S1",
            @"S6",
            @"S6",
        },
        {
            @"S5",
            @"S5",
            @"S6",
        },
        {
            @"S6",
            @"S6",
            @"S3",
        },
        {
            @"S4",
            @"S4",
            @"S6",
        },
        {
            @"S1",
            @"S1",
            @"S7",
        },
        {
            @"S6",
            @"S6",
            @"S7",
        },
        {
            @"S7",
            @"S3",
            @"S3",
        },
    },
    {
        {
            @"S1",
            @"S2",
            @"S4",
        },
        {
            @"S1",
            @"S6",
            @"S3",
        },
        {
            @"S2",
            @"S4",
            @"S6",
        },
        {
            @"S4",
            @"S5",
            @"S6",
        },
        {
            @"S1",
            @"S6",
            @"S7",
        },
        {
            @"S1",
            @"S5",
            @"S8",
        },
        {
            @"S1",
            @"S3",
            @"S5",
        },
        {
            @"S1",
            @"S4",
            @"S8",
        },
        {
            @"S3",
            @"S6",
            @"S8",
        },
        {
            @"S1",
            @"S3",
            @"S8",
        },
    }
};

NSString *ansPLData[3][10][3] =
{
    {
        {
            @"S1",
            @"S2"
        },
        {
            @"S1",
            @"S3"
        },
        {
            @"S1",
            @"S4"
        },
        {
            @"S1",
            @"S5"
        },
        {
            @"S2",
            @"S4"
        },
        {
            @"S1",
            @"S6"
        },
        {
            @"S5",
            @"S6"
        },
        {
            @"S6",
            @"S3"
        },
        {
            @"S4",
            @"S3"
        },
        {
            @"S4",
            @"S6"
        },
    },
    {
        {
            @"S1",
            @"S2",
        },
        {
            @"S1",
            @"S3",
        },
        {
            @"S1",
            @"S4",
        },
        {
            @"S1",
            @"S6",
        },
        {
            @"S5",
            @"S6",
        },
        {
            @"S6",
            @"S3",
        },
        {
            @"S4",
            @"S6",
        },
        {
            @"S1",
            @"S7",
        },
        {
            @"S6",
            @"S7",
        },
        {
            @"S7",
            @"S3",
        },
    },
    {
        {
            @"S1",
            @"S2",
            @"S4",
        },
        {
            @"S1",
            @"S6",
            @"S3",
        },
        {
            @"S2",
            @"S4",
            @"S6",
        },
        {
            @"S4",
            @"S5",
            @"S6",
        },
        {
            @"S1",
            @"S6",
            @"S7",
        },
        {
            @"S1",
            @"S5",
            @"S8",
        },
        {
            @"S1",
            @"S3",
            @"S5",
        },
        {
            @"S1",
            @"S4",
            @"S8",
        },
        {
            @"S3",
            @"S6",
            @"S8",
        },
        {
            @"S1",
            @"S3",
            @"S8",
        },
    }
};


@implementation QuestionDB

-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index
{
    self=[super init];
    if (self) {
        _qsType = type;
        _diff = diff;
        _qsItemArr  = [NSMutableArray arrayWithCapacity:20];
        _ansItemArr = [NSMutableArray arrayWithCapacity:20];
    }
}
-(void)showQuestion
{
    
}
@end

@implementation QuestionPL
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index  {
    self = [super initWithDiff:diff Type:type Index:index];
    if (self) {
        switch (diff) {
            case 1:
            {
                _qsCount = 6;
                _ansCount = 2;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_1"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_1"];
            }
                break;
            case 2:
            {
                _qsCount = 9;
                _ansCount = 2;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_1"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_1"];
            }
                break;
            case 3:
            {
                _qsCount = 9;
                _ansCount = 3;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_1"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_1"];
            }
                break;
        }
        
        [self addChild:_qsFrame z:1];
        _qsFrame.scale = 0 ;
        [self addChild:_ansFrame z:1];
        [self showQuestion];
        _ansFrame.scale = 0;
        
        
        
        
        //question init
            for (int j = 0 ; j < _qsCount; j++) {
                CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff-1][index][j%3]];
                [_qsItemArr addObject:item];
                [self addChild:item z:1];
            }
        
        
        //answer init
        for (int i = 0 ; i < _ansCount ; i ++ ) {
            CCSprite *item = [CCSprite spriteWithSpriteFrameName:ansPLData[diff-1][index][i]];
            [_ansItemArr addObject:item];
        }
        
        qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount];
        realAnswer = [_qsItemArr objectAtIndex:qsIndex];
        //ansStr = qsPLData[diff-1][index][j]
        
        
        realQs = [CCSprite spriteWithFile:@"plqs.png"];
        [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
        
        
        
                
        
    }
    return self;
}

-(void)showQuestion
{
    
}

@end
