//
//  Role.m
//  PenguinLetter
//
//  Created by Ivan on 13-5-20.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import "Role.h"

#import "GameScene.h"

#pragma mark -
#pragma mark ShaderBlur



@implementation SpriteBlur
-(id) initWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
	if( (self=[super initWithTexture:texture rect:rect]) ) {
        
		CGSize s = [self.texture contentSizeInPixels];
        
		blur_ = ccp(1/s.width, 1/s.height);
		sub_[0] = sub_[1] = sub_[2] = sub_[3] = 0;
        
		GLchar * fragSource = (GLchar*) [[NSString stringWithContentsOfFile:[[CCFileUtils sharedFileUtils] fullPathForFilenameIgnoringResolutions:@"Shaders/Blur.frag"] encoding:NSUTF8StringEncoding error:nil] UTF8String];      
        
		self.shaderProgram = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureColor_vert fragmentShaderByteArray:fragSource];
        
        
		CHECK_GL_ERROR_DEBUG();
        
		[self.shaderProgram addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
		[self.shaderProgram addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
		[self.shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
        
		CHECK_GL_ERROR_DEBUG();
        
		[self.shaderProgram link];
        
		CHECK_GL_ERROR_DEBUG();
        
		[self.shaderProgram updateUniforms];
        
		CHECK_GL_ERROR_DEBUG();
        
		subLocation = glGetUniformLocation( self.shaderProgram.program, "substract");
		blurLocation = glGetUniformLocation( self.shaderProgram.program, "blurSize");
        
		CHECK_GL_ERROR_DEBUG();
        [self setBlurSize:0];
	}
    
	return self;
}

-(void) draw
{
	ccGLEnableVertexAttribs(kCCVertexAttribFlag_PosColorTex );
	ccBlendFunc blend = self.blendFunc;
	ccGLBlendFunc( blend.src, blend.dst );
    
	[self.shaderProgram use];
	[self.shaderProgram setUniformsForBuiltins];
	[self.shaderProgram setUniformLocation:blurLocation withF1:blur_.x f2:blur_.y];
	[self.shaderProgram setUniformLocation:subLocation with4fv:sub_ count:1];
    
	ccGLBindTexture2D(  [self.texture name] );
    
	//
	// Attributes
	//
#define kQuadSize sizeof(_quad.bl)
	long offset = (long)&_quad;
    
	// vertex
	NSInteger diff = offsetof( ccV3F_C4B_T2F, vertices);
	glVertexAttribPointer(kCCVertexAttrib_Position, 3, GL_FLOAT, GL_FALSE, kQuadSize, (void*) (offset + diff));
    
	// texCoods
	diff = offsetof( ccV3F_C4B_T2F, texCoords);
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (void*)(offset + diff));
    
	// color
	diff = offsetof( ccV3F_C4B_T2F, colors);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (void*)(offset + diff));
    
    
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	CC_INCREMENT_GL_DRAWS(1);
}

-(void) setBlurSize:(CGFloat)f
{
	CGSize s = [self.texture contentSizeInPixels];
    
	blur_ = ccp(1/s.width, 1/s.height);
	blur_ = ccpMult(blur_,f);
}

@end


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
    if (_isBack) {
        anion = [aniCache animationByName:@"catcher_run_back"];
    }
    _acRun = [CCAnimate actionWithAnimation:anion];
    
    anion = [aniCache animationByName:@"catcher_jump"];
    if (_isBack) {
        anion = [aniCache animationByName:@"catcher_jump_back"];
    }
    _acJump = [CCAnimate actionWithAnimation:anion];
    
    
     
    NSMutableArray *animFrames = [NSMutableArray arrayWithCapacity:10];
    //speedup0
    {
        CCAnimation* animation1;
        //CCAnimation *animation   = [CCAnimation animation];
        for (int i = 1; i <4; i ++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_speedUp0_%d",i]];
            [animFrames addObject:frame];
            //[animation addSpriteFrame:frame];
            animation1.restoreOriginalFrame = NO;
            animation1.delayPerUnit = 0.1;
        }
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        id a1 = [CCAnimate actionWithAnimation:animation1];
        id as1 = [CCRepeat actionWithAction:a1 times:20];
        [animFrames removeAllObjects];
        
        CCAnimation *animation2;
        for (int i = 1; i <4; i ++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"s_catcher_speedUp0_back_%d",i]];
            [animFrames addObject:frame];
            animation2.restoreOriginalFrame = NO;
            animation2.delayPerUnit = 0.1;
        }
         animation2 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        id a2 = [CCAnimate actionWithAnimation:animation2];
        id as2 = [CCRepeat actionWithAction:a2 times:20];
        [animFrames removeAllObjects];
        
        if (!_isBack)
        {
            acSpeedUp[0] = as1;
        }
        else
        {
            acSpeedUp[0] = as2;
        }
    }
    //speedup1
    {
        
        CCAnimation* animation1;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_2"]];
        animation1.restoreOriginalFrame = NO;
        animation1.delayPerUnit = 0.1;
        animation1 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        id a1 = [CCAnimate actionWithAnimation:animation1];
        
        CCAnimation* animation2;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_3"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_4"]];
        animation2.restoreOriginalFrame = NO;
        animation2.delayPerUnit = 0.1;
        animation2 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        id a2 =  [CCAnimate actionWithAnimation:animation2];
        id as1 = [CCSequence actions:a1,[CCRepeat actionWithAction:a2 times:15], nil];
        
        
         CCAnimation* animation3;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_back_1"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_back_2"]];
        animation3.restoreOriginalFrame = NO;
        animation3.delayPerUnit = 0.1;
        animation3 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        id a3 = [CCAnimate actionWithAnimation:animation3];
        
        CCAnimation* animation4;
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_back_3"]];
        [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"s_catcher_speedUp1_back_4"]];
        animation4.restoreOriginalFrame = NO;
        animation4.delayPerUnit = 0.1;
        animation4 = [CCAnimation animationWithSpriteFrames:animFrames delay:0.1];
        [animFrames removeAllObjects];
        
        
        //id am = [CCMoveBy actionWithDuration:0 position:ccp(0, 80)];
        id a4 =  [CCAnimate actionWithAnimation:animation4];
        id as2 = [CCSequence actions:a3,[CCRepeat actionWithAction:a4 times:15], nil];
        
        
        if (!_isBack)
        {
            acSpeedUp[1] = as1;
        }
        else {
            acSpeedUp[1] = as2;
        }
        
    }
    
    
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
-(void)speedUp:(int)a
{
    
    [self stopAllActions];
    //CCLOG(@"%d",a);
    id as = [CCSequence actions:acSpeedUp[a],[CCCallBlock actionWithBlock:^{
        [_delegate CatcherAnimationDidFinished:self WithType:a];
    }],nil];
    [self runAction:as];
    //[self setBlurSize:3];
    
}
-(void)Run
{
    [self unschedule:_cmd];
    [self stopAllActions];
    CCActionInterval * a = [CCRepeatForever actionWithAction:_acRun];
    [a setTag:11];
    //[self runAction:acSpeedUp[0]];
    [self runAction:a];
}
-(void)speedDown
{
}
-(void)drop
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_catcher_ani.plist"];
    
    
}
-(void)remove
{
}
@end