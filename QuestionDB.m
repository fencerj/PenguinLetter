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
    return self;
}
-(void)showQuestion
{
    
}
@end

@implementation QuestionPL
-(id)initWithDiff:(int)diff Type:(int)type Index:(int)index  {
    self = [super initWithDiff:diff Type:type Index:index];
    if (self) {
        [self setTouchEnabled:YES];
        //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_1.plist"];
       //[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame_2.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"qs_frame.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_qs_pl.plist"];
        
        switch (diff) {
                
            case 1:
            {
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
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff-1][index-1][j%2]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(307,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff-1][index-1][qsIndex%3];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(307,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff-1][index-1][i]];
                    item.itemNames = ansPLData[diff-1][index-1][i];
                    if ([qsName isEqualToString:item.itemNames]) {
                        item.isCorrect = YES;
                    }
                    [_ansItemArr addObject:item];
                    [_ansFrame addChild:item];
                    item.position = ccp(200,150);
                }
                
                [_ansItemArr retain];
                [_qsItemArr retain];
                [self alignItemsVerticallyWithPadding:30 Target:_ansItemArr];
                [self alignItemsHorizontallyWithPadding:-0 Target:_qsItemArr];
               
            }
                break;
                
            case 2:
            {
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
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff-1][index-1][j%3]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(500,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff-1][index-1][qsIndex%3];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(512,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff-1][index-1][i]];
                    item.itemNames = ansPLData[diff-1][index-1][i];
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
                [self alignItemsHorizontallyWithPadding:-20 Target:_qsItemArr];
                 
            }
                break;
            case 3:
            {
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
                    CCSprite *item = [CCSprite spriteWithSpriteFrameName:qsPLData[diff-1][index-1][j%3]];
                    [_qsItemArr addObject:item];
                    item.position = ccp(500,140);
                    [_qsFrame addChild:item];
                }
                
                qsIndex = [GameScene createRandomsizeValueInt:0 toInt:_qsCount-1];
                qsName = qsPLData[diff-1][index-1][qsIndex%3];
                realQs = [CCSprite spriteWithSpriteFrameName:@"plqs"];
                realQs.position = ccp(512,140);
                [_qsFrame removeChild:[_qsItemArr objectAtIndex:qsIndex]];
                [_qsItemArr replaceObjectAtIndex:qsIndex withObject:realQs];
                [_qsFrame addChild:realQs];
                
                
                
                //answer init
                for (int i = 0 ; i < _ansCount ; i ++ ) {
                    AnsItem *item = [AnsItem spriteWithSpriteFrameName:ansPLData[diff-1][index-1][i]];
                    item.itemNames = ansPLData[diff-1][index-1][i];
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
                [self alignItemsHorizontallyWithPadding:-20 Target:_qsItemArr];
            }
                break;
        }
    }
    return self;
}
-(void)registerWithTouchDispatcher
{
    
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:kCCMenuHandlerPriority swallowsTouches:YES];
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

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint rightPosition = [touch locationInView:[touch view]];
	rightPosition = [[CCDirector sharedDirector] convertToGL:rightPosition];
	   
   
    return YES;
	
}
-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint rightPosition = [touch locationInView:[touch view]];
	rightPosition = [[CCDirector sharedDirector] convertToGL:rightPosition];
    rightPosition = [_qsFrame convertToNodeSpace:rightPosition];
    for (AnsItem *item in _ansItemArr) {
        if (CGRectContainsPoint([item boundingBox],rightPosition)) {
            if (item.isCorrect) {
                [self canceledQuestion];
                [_delegate answerIsCorrect:self];
                CCLOG(@"isCorrect");
            }
            else
            {
                [self canceledQuestion];
                [_delegate answerIsCorrect:self];
                CCLOG(@"fault");
            }
        }
    }
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
            if (item.isCorrect) {
                [self canceledQuestion];
                [_delegate answerIsCorrect:self];
                CCLOG(@"isCorrect");
            }
            else
            {
                [self canceledQuestion];
                [_delegate answerIsFault:self];
                CCLOG(@"fault");
            }
        }
    }
}
-(void)showQuestion
{
    
}
-(void)canceledQuestion
{
    [_qsFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:0]];
    [_ansFrame runAction:[CCScaleTo actionWithDuration:0.5 scale:0]];
}
@end
