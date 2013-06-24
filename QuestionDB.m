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

NSString *qsFFData[2][8][4] =
{
    {
        {
            @"S1",
            @"S1",
            @"S2",
            @"S1",
        },
        {
            @"S2",
            @"S2",
            @"S1",
            @"S2"
        },
        {
            @"S1",
            @"S1",
            @"S3",
            @"S1"
        },
        {
            @"S1",
            @"S1",
            @"S5",
            @"S1"

        },
        {
            @"C1",
            @"C1",
            @"S1",
            @"C1"
        },
        {
            @"S1",
            @"S1",
            @"S6",
            @"S1"
        },
        {
            @"H1",
            @"H1",
            @"S1",
            @"H1"
        },
        {
            @"S1",
            @"S1",
            @"S4",
            @"S1"
        }
    },
    {
        {
            @"S2",
            @"S2",
            @"S4",
            @"S2"
        },
        {
            @"S4",
            @"S4",
            @"S6",
            @"S4"
        },
        {
            @"S1",
            @"S1",
            @"S1B",
            @"S1"
        },
        {
            @"S1",
            @"S1",
            @"S1C",
            @"S1"
        },
        {
            @"S6",
            @"S6",
            @"S7",
            @"S6"
        },
        {
            @"S7",
            @"S7",
            @"S8",
            @"S7"
        },
        {
            @"S1A",
            @"S1A",
            @"S1C",
            @"S1A",
        },
        {
            @"S5",
            @"S5",
            @"S6",
            @"S5"
        },
    },
};

NSString *ansFFData[2][8][2] =
{
    {
        {
            @"S1",
            @"S2"
        },
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
            @"S5"
        },
        {
            @"C1",
            @"S1"
        },
        {
            @"S1",
            @"S6"
        },
        {
            @"H1",
            @"S1"
        },
        {
            @"S1",
            @"S4"
        },

    },
    {
        {
            @"S2",
            @"S4",
        },
        {
            @"S4",
            @"S6",
        },
        {
            @"S1",
            @"S1B",
        },
        {
            @"S1",
            @"S1C",
        },
        {
            @"S6",
            @"S7",
        },
        {
            @"S7",
            @"S8",
        },
        {
            @"S1A",
            @"S1C",
        },
        {
            @"S5",
            @"S6",
        }
    },
};


NSString *qsOTData[3][18] =
{
    {
        @"SQ1_1",
        @"SQ1A_1",
        @"SQ1C_1",
        @"SQ6_1",
        @"SQ7_1",
        @"SQ8_1",
        @"SQ1P_1",
        @"SQ1BP_1",
        @"SQ1AP_1",
        @"T_S4",
        @"T_S1F",
        @"T_S1G",
        @"T_S1F",
        @"T_S1",
        @"T_S1",
        @"T_S1",
        @"T_S5",
        @"T_S1",
    },
    {
        
        @"SQ1_5",
        @"SQ1B_1",
        @"SQ6_5",
        @"SQ7_5",
        @"SQ8_5",
        @"SQ6P_1",
        @"SQ7P_1",
        @"SQ8P_1",
        @"T_S1",
        @"T_S6",
        @"T_S6",
        @"T_S7",
        @"T_S7",
        @"T_S7",
        @"T_S15",
        @"T_S6",
        @"T_S1G",
    },
    {
        @"S1234Q",
        @"S1456",
        @"S4678",
        @"S1111",
        @"S468",
        @"S167",
        @"S4467",
        @"S234",
        @"T_S8",
        @"T_S1",
        @"T_S6",
        @"T_S7",        
    }
};
NSString *ansOTData[3][18][4] =
{
    {
        {
            @"SA1_2",
            @"SA1_3",
            @"",
            @"0",
        },
        {
            @"SA1A_2",
            @"SA1A_3",
            @"",
            @"0",
        },
        {
            @"SA1C_3",
            @"SA1C_2",
            @"",
            @"1",
        },
        {
            @"SA6_2",
            @"SA6_4",
            @"SA6_3",
            @"0",
        },
        {
            @"SA7_4",
            @"SA7_3",
            @"SA7_2",
            @"2",
        },
        {
            @"SA8_3",
            @"SA8_2",
            @"SA8_4",
            @"1",
        },
        {
            @"S1P_3",
            @"S1P_2",
            @"S1P_4",
            @"1",
        },
        {
            @"S1BP_2",
            @"S1BP_4",
            @"S1BP_3",
            @"0",
        },
        {
            @"S1AP_3",
            @"S1AP_4",
            @"S1AP_2",
            @"2",
        },
        {
            @"S1",
            @"C1",
            @"H9",
            @"0",
        },
        {
            @"C1",
            @"H9",
            @"S1",
            @"2",
        },
        {
            @"C1",
            @"S1",
            @"H9",
            @"1",
        },
        {
            @"S4",
            @"S1",
            @"S7",
            @"1",
        },
        {
            @"S17",
            @"S16",
            @"S15",
            @"2",
        },
        {
            @"S9",
            @"S10",
            @"S11",
            @"1",
        },
        {
            @"S5",
            @"C5",
            @"H5",
            @"0",
        },
        {
            @"S1",
            @"C1",
            @"H9",
            @"0",
        },
        {
            @"S3",
            @"C12",
            @"C13",
            @"0",
        },

    },
    {
        {
            @"SA1_6",
            @"SA1_7",
            @"SA1_8",
            @"0",
        },
        {
            @"SA1B_3",
            @"SA1B_4",
            @"SA1B_2",
            @"2",
        },
        {
            @"SA6_8",
            @"SA6_7",
            @"SA6_6",
            @"2",
        },
        {
            @"SA7_7",
            @"SA7_6",
            @"SA7_8",
            @"1",
        },
        {
            @"SA8_6",
            @"SA8_7",
            @"SA8_7",
            @"0",
        },
        {
            @"S6P_3",
            @"S6P_2",
            @"S6P_4",
            @"1",
        },
        {
            @"S7P_2",
            @"S7P_3",
            @"S7P_4",
            @"0",
        },
        {
            @"S8P_3",
            @"S8P_2",
            @"S8P_4",
            @"1",
        },
        {
            @"S6",
            @"H6",
            @"C6",
            @"0",
        },
        {
            @"S1",
            @"C1",
            @"H9",
            @"0",
        },
        {
            @"S1G",
            @"C1G",
            @"H1D",
            @"0",
        },
        {
            @"S6",
            @"C6",
            @"H6",
            @"0",
        },
        {
            @"C1",
            @"H1",
            @"S1",
            @"2",
        },
        {
            @"C5",
            @"H5",
            @"S5",
            @"2",
        },
        {
            @"C1",
            @"S1",
            @"H1",
            @"1",
        },
        {
            @"S16",
            @"S17",
            @"S15",
            @"2",
        },
        {
            @"S7",
            @"S8",
            @"S6",
            @"2",
        }

    },
    {
        {
            @"S1234",
            @"S1245",
            @"",
            @"0",
        },
        {
            @"S2456",
            @"S1456A",
            @"",
            @"1",
        },
        {
            @"S4678A",
            @"S467H",
            @"",
            @"0",
        },
        {
            @"S1C",
            @"S3",
            @"",
            @"0",
        },
        {
            @"C1",
            @"S7",
            @"",
            @"1",
        },
        {
            @"S8",
            @"H1",
            @"",
            @"0",
        },
        {
            @"S8",
            @"C1",
            @"",
            @"0",
        },
        {
            @"H1",
            @"S1",
            @"",
            @"1",
        },
        {
            @"C1",
            @"H1",
            @"S1",
            @"2",
        },
        {
            @"C8",
            @"S8",
            @"H8",
            @"1",
        },
        {
            @"S3",
            @"C12",
            @"S14",
            @"0",
        },
        {
            @"S15",
            @"S3",
            @"S12",
            @"1",
        },
    }
};

@implementation AnsItem
-(id) initWithSpriteFrameName:(NSString *)spriteFrameName
{
    if ( self = [super initWithSpriteFrameName:spriteFrameName])
    {
        _itemNames = spriteFrameName;
    }
        return self;
}
-(BOOL)isInBox:(CGPoint)p sprite:(CCSprite*)m_texture
{
	
	if (p.x >  m_texture.position.x-m_texture.contentSize.width/2 && p.x < m_texture.position.x+m_texture.contentSize.width/2
		&& p.y> m_texture.position.y-m_texture.contentSize.height/2-2 &&p.y<m_texture.position.y+m_texture.contentSize.height/2) {
		//isSelected = YES;
		CCLOG(@"inBox");
		return YES;
	}
	else {
		//isSelected = NO;
		return NO;
	}
	//return isSelected;
	
}
@end

@implementation QuestionLayer

-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index
{
    self=[super init];
    if (self) {
        _qsType = type;
        _diff = diff;
        _qsItemArr  = [NSMutableArray arrayWithCapacity:20];
        _ansItemArr = [NSMutableArray arrayWithCapacity:20];
        _availbleQs = [NSMutableArray arrayWithCapacity:100];
        
    }
    return self;
}
-(void)correctAnswerAni:(int)effetid Pos:(CGPoint)pos
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_2.plist"];
    [_qsFrame removeAllChildrenWithCleanup:YES];
    _qsFrame.scale = 1;
    if (_isCorrect) {
        CCAnimation* ani = [CCAnimation animation];
        [ani addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"qsFrameToItem_1"]];
        [ani addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"qsFrameToItem_2"]];
        [ani addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"qsFrameToItem_3"]];
        [ani setDelayPerUnit:0.1];
        [ani setRestoreOriginalFrame:NO];
        
        int effectIndex = effetid;
      
        
        if (effectIndex == 3) {
            id aro = [CCEaseBounceOut actionWithAction:[CCRotateBy actionWithDuration:0.5 angle:400]];
            id ac = [CCAnimate actionWithAnimation:ani];
            id as = [CCSequence actions:ac,[CCCallBlock actionWithBlock:^{
                [_qsFrame setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"speedItem_3"]];
                [_qsFrame runAction:aro];
                [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:0]];
                [_qsFrame runAction:[CCSequence actions:[CCEaseIn actionWithAction:[CCMoveBy actionWithDuration:0.5 position:ccp(-100,-200)] rate:2.0],[CCCallBlock actionWithBlock:^{
                    [_delegate answerJudgeFinished:self isCorrect:_isCorrect];
                }],nil]];
            }],nil];
            [_qsFrame runAction:as];
        }
        else
        {
            
            CCAnimation* ani1 = [CCAnimation animation];
            [ani1 addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"speedItem_%d_1",effectIndex]]];
            [ani1 addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"speedItem_%d_2",effectIndex]]];
            [ani1 setDelayPerUnit:0.1];
            [ani1 setRestoreOriginalFrame:NO];
           
            
            id ac = [CCAnimate actionWithAnimation:ani];
            id ac1 = [CCAnimate actionWithAnimation:ani1];
            id as = [CCSequence actions:ac,[CCCallBlock actionWithBlock:^{
                [_qsFrame runAction:[CCRepeatForever actionWithAction:ac1]];
                [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:0]];
                [_qsFrame runAction:[CCSequence actions:[CCEaseIn actionWithAction:[CCMoveBy actionWithDuration:0.5 position:ccp(-100,-200)] rate:2.0],[CCCallBlock actionWithBlock:^{
                    [_delegate answerJudgeFinished:self isCorrect:_isCorrect];
                }],nil]];
            }],nil];
            [_qsFrame runAction:as];
        }
    }
    else
    {
        [_delegate answerJudgeFinished:self isCorrect:_isCorrect];
    }
    //[_qsFrame runAction:];
}

-(void)canceledQuestion
{
    
    
}
-(void)showQuestion
{
    
}
-(void)registerWithTouchDispatcher
{
    
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:kCCMenuHandlerPriority swallowsTouches:NO];
}
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint rightPosition = [touch locationInView:[touch view]];
	rightPosition = [[CCDirector sharedDirector] convertToGL:rightPosition];
    return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint rightPosition = [touch locationInView:[touch view]];
	rightPosition = [[CCDirector sharedDirector] convertToGL:rightPosition];
    rightPosition = [_ansFrame convertToNodeSpace:rightPosition];
    CCLOG(@"%f,%f",rightPosition.x,rightPosition.y);
    
    for (AnsItem *item in _ansItemArr) {
        CCLOG(@"rect %f.%f",item.boundingBox.origin.x,item.boundingBox.origin.y);
        if (CGRectContainsPoint([item boundingBox],rightPosition)) { 
                _isCorrect =  item.isCorrect;
                if (item.isCorrect) {
                    CCLOG(@"isCorrect");
                }
                else
                {
                    CCLOG(@"fault");
                }
                //[self canceledQuestion];
                //[_delegate answerIsCorrect:self];
                //[_delegate answerIsCorrect:self];correctAnswerAni
            int a = [GameScene createRandomsizeValueInt:1 toInt:4];
                [_qsFrame runAction:[CCSequence actions:[CCScaleTo actionWithDuration:0.5 scale:0],[CCCallBlock actionWithBlock:^{[self correctAnswerAni:a Pos:CGPointZero];}],nil ]];
                [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:0]];
                [_delegate answerJudgeBegin:self isCorrect:_isCorrect EffectId:a];
                break;
            }        
    }
}
@end

@implementation QuestionPL
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index  {
    self = [super initWithDiff:diff Type:type Index:index];
    if (self) {
        [self setTouchEnabled:YES];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_1.plist"];
       [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_2.plist"];
        //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_qs_pl.plist"];

        switch (diff) {
                
            case 0:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:9];
                _qsCount = 6;
                _ansCount = 2;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_1"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_1"];
                _qsFrame.position = ccp(345,445);
                _ansFrame.position = ccp(825,459);
                [self addChild:_qsFrame z:1];
                _qsFrame.scale = 0 ;
                [self addChild:_ansFrame z:1];
                [self showQuestion];
                _ansFrame.scale = 0;
                [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                
                
                //question init
                for (int j = 0 ; j < _qsCount; j++) {
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff][index][j%2]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(315+40,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff][index][qsIndex%2];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(315+40,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff][index][i]];
                    item.itemNames = ansPLData[diff][index][i];
                    if ([qsName isEqualToString:item.itemNames]) {
                        item.isCorrect = YES;
                    }
                    [_ansItemArr addObject:item];
                    [_ansFrame addChild:item];
                    item.position = ccp(200-100+10,230);
                }
                
                [_ansItemArr retain];
                [_qsItemArr retain];
                [self alignItemsVerticallyWithPadding:40 Target:_ansItemArr];
                [self alignItemsHorizontallyWithPadding:-0 Target:_qsItemArr];
               
            }
                break;
                
            case 1:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:9];
                _qsCount = 9;
                _ansCount = 2;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_3"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_3"];
                _qsFrame.position = ccp(512,546);
                _ansFrame.position = ccp(725,330);
                [self addChild:_qsFrame z:1];
                _qsFrame.scale = 0 ;
                [self addChild:_ansFrame z:1];
                [self showQuestion];
                _ansFrame.scale = 0;
                [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                
                
                //question init
                for (int j = 0 ; j < _qsCount; j++) {
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff][index][j%3]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(500,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff][index][qsIndex%3];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(500,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff][index][i]];
                    item.itemNames = ansPLData[diff][index][i];
                    if ([qsName isEqualToString:item.itemNames]) {
                        item.isCorrect = YES;
                    }
                    [_ansItemArr addObject:item];
                    [_ansFrame addChild:item];
                    item.position = ccp(200,102);
                }
                
                [_ansItemArr retain];
                [_qsItemArr retain];
                [self alignItemsHorizontallyWithPadding:20 Target:_ansItemArr];
                [self alignItemsHorizontallyWithPadding:0 Target:_qsItemArr];
                 
            }
                break;
            case 2:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:9];
                _qsCount = 9;
                _ansCount = 3;
                _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_3"];
                _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_3"];
                _qsFrame.position = ccp(512,546);
                _ansFrame.position = ccp(725,330);
                [self addChild:_qsFrame z:1];
                _qsFrame.scale = 0 ;
                [self addChild:_ansFrame z:1];
                [self showQuestion];
                _ansFrame.scale = 0;
                [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
                
                //question init
                for (int j = 0 ; j < _qsCount; j++) {
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff][index][j%3]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(500,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff][index][qsIndex%3];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(500,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff][index][i]];
                    item.itemNames = ansPLData[diff][index][i];
                    if ([qsName isEqualToString:item.itemNames]) {
                        item.isCorrect = YES;
                    }
                    [_ansItemArr addObject:item];
                    [_ansFrame addChild:item];
                    item.position = ccp(200,102);
                }
                
                [_ansItemArr retain];
                [_qsItemArr retain];
                [self alignItemsHorizontallyWithPadding:0 Target:_ansItemArr];
                [self alignItemsHorizontallyWithPadding:0 Target:_qsItemArr];
            }
                break;
        }
    }
    return self;
}

-(void) alignItemsHorizontallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
    
	float width = -padding;
	
	for (AnsItem *item in arr) {
         width += item.contentSize.width * item.scaleX + padding;
    }
	float x = -width / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
		[item setPosition:ccpAdd(item.position, ccp(x + itemSize.width * item.scaleX / 2.0f, 0))];
		x += itemSize.width * item.scaleX + padding;
	}
}
-(void) alignItemsVerticallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
	float height = -padding;
   
	for (AnsItem *item in arr) {
        height += item.contentSize.height * item.scaleY + padding;
    }
	float y = height / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
	    [item setPosition:ccpAdd(item.position,ccp(0, y - itemSize.height * item.scaleY / 2.0f))];
	    y -= itemSize.height * item.scaleY + padding;
	}
}


-(void)showQuestion
{
    
}
-(void)nextQuestion
{
    
}
@end


@implementation QuestionFF
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index  {
    self = [super initWithDiff:diff Type:type Index:index];
    if (self) {
        [self setTouchEnabled:YES];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_1.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_2.plist"];
        //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_qs_ff.plist"];
        
        
        if (diff==2) {
            diff=1;
        }
        
        index = [GameScene createRandomsizeValueInt:0 toInt:7];
        _qsCount = 4;
        _ansCount = 2;
        _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_1"];
        _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_1"];
        _qsFrame.position = ccp(345,445);
        _ansFrame.position = ccp(825,459);
        [self addChild:_qsFrame z:1];
        _qsFrame.scale = 0 ;
        [self addChild:_ansFrame z:1];
        [self showQuestion];
        _ansFrame.scale = 0;
        [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
        [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
        
        
        //question init
        for (int j = 0 ; j < _qsCount; j++) {
            CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsFFData[diff][index][j]];
            [_qsItemArr addObject:item];
            item.position = ccp(315+35,140-10);
            [_qsFrame addChild:item];
        }
        
        //answer init
        for (int i = 0 ; i < _ansCount ; i ++ ) {
            AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansFFData[diff][index][i]];
            item.itemNames = ansFFData[diff][index][i];
            if ([item.itemNames isEqualToString:qsFFData[diff][index][2]]) {
                item.isCorrect = YES;
            }
            [_ansItemArr addObject:item];
            [_ansFrame addChild:item];
            item.position = ccp(120,230);
        }
        
        [_ansItemArr retain];
        [_qsItemArr retain];
        [self alignItemsVerticallyWithPadding:40 Target:_ansItemArr];
        [self alignItemsHorizontallyWithPadding:20 Target:_qsItemArr];
        
      
    }
    return self;
}

-(void) alignItemsHorizontallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
    
	float width = -padding;
	
	for (AnsItem *item in arr) {
        width += item.contentSize.width * item.scaleX + padding;
    }
	float x = -width / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
		[item setPosition:ccpAdd(item.position, ccp(x + itemSize.width * item.scaleX / 2.0f, 0))];
		x += itemSize.width * item.scaleX + padding;
	}
}
-(void) alignItemsVerticallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
	float height = -padding;
    
	for (AnsItem *item in arr) {
        height += item.contentSize.height * item.scaleY + padding;
    }
	float y = height / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
	    [item setPosition:ccpAdd(item.position,ccp(0, y - itemSize.height * item.scaleY / 2.0f))];
	    y -= itemSize.height * item.scaleY + padding;
	}
}


-(void)showQuestion
{
    
}
-(void)nextQuestion
{
    
}
@end


@implementation QuestionOT
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index  {
    self = [super initWithDiff:diff Type:type Index:index];
    if (self) {
        [self setTouchEnabled:YES];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_1.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_2.plist"];
        //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_qs_OT.plist"];
        
        

        
        
        switch (diff) {
                
            case 0:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:17];
                _qsCount = 1;
                _ansCount = 3;
                if (index == 0 || index == 1 ||index == 2) {
                    _ansCount = 2;
                }

                
            }
                break;
                
            case 1:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:16];
                _qsCount = 1;
                _ansCount = 3;
               
                
            }
                break;
            case 2:
            {
                index = [GameScene createRandomsizeValueInt:0 toInt:11];
                _qsCount = 9;
                _ansCount = 2;
                if (index == 8 || index == 9 ||index == 10 ||index == 11) {
                    _ansCount = 3;
                }
   
            }
                break;
        }
        
        
        
        
        _qsFrame  = [CCSprite spriteWithSpriteFrameName:@"frame_qs_2"];
        _ansFrame = [CCSprite spriteWithSpriteFrameName:@"frame_ans_2"];
        _qsFrame.position = ccp(345,445);
        _ansFrame.position = ccp(825,459);
        [self addChild:_qsFrame z:1];
        _qsFrame.scale = 0 ;
        [self addChild:_ansFrame z:1];
        [self showQuestion];
        _ansFrame.scale = 0;
        [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
        [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:1]];
        
        //question init
        CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsOTData[diff][index]];
        [_qsItemArr addObject:item];
        item.position = ccp(250-5,230);
        [_qsFrame addChild:item];
        
        
        //answer init
        for (int i = 0 ; i < _ansCount ; i ++ ) {
            AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansOTData[diff][index][i]];
            item.itemNames = ansOTData[diff][index][i];
            CCLOG(@"aaaa %@,%d",ansOTData[diff][index][i],[ansOTData[diff][index][i]  intValue]);
            if (i == [ansOTData[diff][index][3]  intValue]) {
                item.isCorrect = YES;
            }
            [_ansItemArr addObject:item];
            [_ansFrame addChild:item];
            item.position = ccp(200-100+32,230+10);
        }
        
        [_ansItemArr retain];
        [_qsItemArr retain];
        
        if (_ansCount == 2) {
            
            [self alignItemsVerticallyWithPadding:40 Target:_ansItemArr];
        }
        else
            
            [self alignItemsVerticallyWithPadding:0 Target:_ansItemArr];
    }
    return self;
}

-(void) alignItemsHorizontallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
    
	float width = -padding;
	
	for (AnsItem *item in arr) {
        width += item.contentSize.width * item.scaleX + padding;
    }
	float x = -width / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
		[item setPosition:ccpAdd(item.position, ccp(x + itemSize.width * item.scaleX / 2.0f, 0))];
		x += itemSize.width * item.scaleX + padding;
	}
}
-(void) alignItemsVerticallyWithPadding:(float)padding Target:(NSMutableArray*)arr
{
	float height = -padding;
    
	for (AnsItem *item in arr) {
        height += item.contentSize.height * item.scaleY + padding;
    }
	float y = height / 2.0f;
    
	for (AnsItem *item in arr) {
		CGSize itemSize = item.contentSize;
	    [item setPosition:ccpAdd(item.position,ccp(0, y - itemSize.height * item.scaleY / 2.0f))];
	    y -= itemSize.height * item.scaleY + padding;
	}
}


-(void)showQuestion
{
    
}
-(void)nextQuestion
{
    
}
@end
