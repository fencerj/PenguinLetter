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
        
		GLchar * fragSource = (GLchar*) [[NSString stringWithContentsOfFile:[[CCFileUtils sharedFileUtils] fullPathForFilenameIgnoringResolutions:@"Blur.frag"] encoding:NSUTF8StringEncoding error:nil] UTF8String];      
        
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

@synthesize animationNode;
-(id)initWithFrameName:(NSString*)frameName  // AniCount:(int[4])count
{
    //    _aniCount[0] = count[0];
    //    _aniCount[1] = count[1];
    //    _aniCount[2] = count[2];
    //    _aniCount[3] = count[3];
    aniCache = [CCAnimationCache sharedAnimationCache];
    _canAction = YES;
    _val = 0;
    return [self initWithSpriteFrameName:frameName];
    
}
-(void)initAnimation
{
    
    
    self.opacity = 0;
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"s_role_ani.plist"];
    
    _acRun = @"pao";
    _acFall = @"shuai";
    _acScare = @"jing";
    _acJump = @"tiao";
    
    NSString *aniFileStr = @"role_ani";
    animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
    animationNode.timeScale = 1.0f;
    animationNode.visible = YES;
    animationNode.position = ccp(self.contentSize.width/2,0);
    [self addChild:animationNode z:3];
    
    [self Run];
    
}

-(void)Jump
{
    [animationNode addAnimation:_acJump loop:NO afterDelay:_delayTime];
}
-(void)Run
{
    [self unschedule:_cmd];
    [animationNode addAnimation:_acRun loop:YES afterDelay:_delayTime];
}
-(void)Scare
{
     [animationNode addAnimation:_acScare loop:YES afterDelay:_delayTime];
    
}
-(void)Fall
{

    [animationNode addAnimation:_acFall loop:NO afterDelay:_delayTime];
}
-(void)faceGood
{
    face = [CCSprite spriteWithSpriteFrameName:@"s_role_face_t"];
    [self addChild:face z:1];
    face.position = ccp(face.contentSize.width*1.6,face.contentSize.height*1.6);
    [face runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.2],[CCDelayTime actionWithDuration:0.8],[CCFadeOut actionWithDuration:0.2],[CCCallBlock actionWithBlock:^{ [self removeChild:face cleanup:YES];}],nil]];
}
-(void)faceBad
{
    face = [CCSprite spriteWithSpriteFrameName:@"s_role_face_f"];
    [self addChild:face z:1];
    face.position = ccp(face.contentSize.width*1.6,face.contentSize.height*1.6);
    [face runAction:[CCSequence actions:[CCFadeIn actionWithDuration:0.2],[CCDelayTime actionWithDuration:0.8],[CCFadeOut actionWithDuration:0.2],[CCCallBlock actionWithBlock:^{ [self removeChild:face cleanup:YES];}],nil]];
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
-(void)drop:(int)efid
{
    
    _isDrop = YES;
    [self stopAllActions];
    
    [self runAction:[CCSequence actions:acDrop[efid-1],[CCCallBlock actionWithBlock:^{
        if (efid == 1) {
            [self runAction:[CCMoveBy actionWithDuration:3 position:ccp(0,1000)]];
        }
        [_delegate CatcherDropDidFinished:self WithType:efid];
    }],nil]];
    
   
}
-(void)Fall
{
    
}
-(void)remove
{
    if (_isDrop) {
        [self removeFromParent];
    }
}

-(void)gameOver
{

    [animationNode addAnimation:_acSpeedUpStr[0] loop:YES afterDelay:_delayTime];
}
@end


@implementation CatcherSheep
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
    self.opacity = 0;
    if (_isBack) {
        _acRunStr  = @"Hpa";
        _acJumpStr = @"Hta";
        _acDropStr[0] = @"Yjiansud";
        _acDropStr[1] = @"Yjiansub";
        _acDropStr[2] = @"Yjiansuc";
        _acDropStr[3] = @"Yjiansua";
        
        _acSpeedUpStr[0] = @"YHjiasua";
        _acSpeedUpStr[1] = @"YHjiasub";
    }
    else
    {
        _acRunStr  = @"Qpa";
        _acJumpStr = @"Qta";
        _acDropStr[0] = @"Yjiansud";
        _acDropStr[1] = @"Yjiansub";
        _acDropStr[2] = @"Yjiansuc";
        _acDropStr[3] = @"Yjiansua";
        
        _acSpeedUpStr[0] = @"YQjiasua";
        _acSpeedUpStr[1] = @"YQjiasub";
    }
    
    NSString *aniFileStr = @"sheep_ani";
    animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
    animationNode.timeScale = 1.0f;
    animationNode.visible = YES;
    animationNode.position = ccp(self.contentSize.width/2,0);
    [self addChild:animationNode z:3];
    [self Run];
   
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
    
    
    //CCLOG(@"%d",a);
    
    float delayTime = 120/30.0f + _delayTime;
    if (a == 0) {
        [animationNode addAnimation:_acSpeedUpStr[a] loop:YES afterDelay:_delayTime];
    }
    else
        [animationNode addAnimation:_acSpeedUpStr[a] loop:NO afterDelay:_delayTime];
    
    id as = [CCSequence actions: [CCDelayTime actionWithDuration:delayTime],[CCCallBlock actionWithBlock:^{
        [self Run];
        [_delegate CatcherAnimationDidFinished:self WithType:a];
    }],nil];
    [self runAction:as];
    //[self setBlurSize:3];
    
}
-(void)Run
{
    [self unschedule:_cmd];
    [animationNode addAnimation:_acRunStr loop:YES afterDelay:_delayTime];
}
-(void)speedDown
{
}
-(void)Fall
{
    [animationNode addAnimation:@"Yt" loop:NO afterDelay:_delayTime];
}
-(void)drop:(int)efid
{
    //efid = 3;
    _isDrop = YES;
    animationNode.timeScale = 1;
    [animationNode addAnimation:_acDropStr[efid-1] loop:NO afterDelay:0];
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:efid!=3 ? 48/30.0f:20/30.0f],[CCCallBlock actionWithBlock:^{
        //[self Run];
        [_delegate CatcherDropDidFinished:self WithType:efid];
    }],nil]];
    
}
-(void)remove
{
    if (_isDrop) {
        [self removeFromParent];
    }
}
@end

@implementation CatcherHorse
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
    self.opacity = 0;
    if (_isBack) {
        _acRunStr  = @"Hpa";
        _acJumpStr = @"Hta";
        _acDropStr[0] = @"Yjiansud";
        _acDropStr[1] = @"Yjiansub";
        _acDropStr[2] = @"Yjiansuc";
        _acDropStr[3] = @"Yjiansua";
        
        _acSpeedUpStr[0] = @"YHjiasua";
        _acSpeedUpStr[1] = @"YHjiasub";
    }
    else
    {
        _acRunStr  = @"Qpa";
        _acJumpStr = @"Qta";
        _acDropStr[0] = @"Yjiansud";
        _acDropStr[1] = @"Yjiansub";
        _acDropStr[2] = @"Yjiansuc";
        _acDropStr[3] = @"Yjiansua";
        
        _acSpeedUpStr[0] = @"YQjiasua";
        _acSpeedUpStr[1] = @"YQjiasub";
    }
    
    NSString *aniFileStr = @"sheep_ani";
    animationNode = [CCSkeletonAnimation skeletonWithFile:[NSString stringWithFormat:@"%@.json",aniFileStr] atlasFile:[NSString stringWithFormat:@"%@.atlas",aniFileStr]  scale:0.5];
    animationNode.timeScale = 1.0f;
    animationNode.visible = YES;
    animationNode.position = ccp(self.contentSize.width/2,0);
    [self addChild:animationNode z:3];
    [self Run];
    
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
    
    
    //CCLOG(@"%d",a);
    
    float delayTime = 120/30.0f + _delayTime;
    if (a == 0) {
        [animationNode addAnimation:_acSpeedUpStr[a] loop:YES afterDelay:_delayTime];
    }
    else
        [animationNode addAnimation:_acSpeedUpStr[a] loop:NO afterDelay:_delayTime];
    
    id as = [CCSequence actions: [CCDelayTime actionWithDuration:delayTime],[CCCallBlock actionWithBlock:^{
        [self Run];
        [_delegate CatcherAnimationDidFinished:self WithType:a];
    }],nil];
    [self runAction:as];
    //[self setBlurSize:3];
    
}
-(void)Run
{
    [self unschedule:_cmd];
    [animationNode addAnimation:_acRunStr loop:YES afterDelay:_delayTime];
}
-(void)speedDown
{
}
-(void)Fall
{
    [animationNode addAnimation:@"Yt" loop:NO afterDelay:_delayTime];
}
-(void)drop:(int)efid
{
    //efid = 3;
    _isDrop = YES;
    animationNode.timeScale = 1;
    [animationNode addAnimation:_acDropStr[efid-1] loop:NO afterDelay:0];
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:efid!=3 ? 48/30.0f:20/30.0f],[CCCallBlock actionWithBlock:^{
        //[self Run];
        [_delegate CatcherDropDidFinished:self WithType:efid];
    }],nil]];
    
}
-(void)remove
{
    if (_isDrop) {
        [self removeFromParent];
    }
}
@end