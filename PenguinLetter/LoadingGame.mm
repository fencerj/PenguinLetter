//
//  LoadingScene.m
//  eBookTest
//
//  Created by fencerj on 10-10-23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadingGame.h"
#import "spine-cocos2d-iphone.h"
@implementation LoadingGame
-(void)dealloc
{
    [super dealloc];
}
+(id)initWithTargetScene:(NSString*)targetSc
{
    
    return [[[self alloc] initScene:targetSc] autorelease];
    
}
-(id)initScene:(NSString*)targetSc
{
    
    if (self = [super init]) {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"loadinggame.plist"];
        CCSprite *sp = [CCSprite spriteWithSpriteFrameName:@"loading_game"];
        sp.anchorPoint = CGPointZero;
        [self addChild:sp];
        _targetSc = targetSc;
        
        
//        CCSprite *sptx = [CCSprite spriteWithFile:@"loading_tx.png"];
//        sptx.position = ccp(531,265);
//        [sp addChild:sptx];
        
        
		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
		
		// position the label on the center of the screen
        //[self waitLoad];
        
        [self schedule:@selector(waitLoad) interval:4];
        //[self performSelectorOnMainThread:@selector(waitLoad) withObject:nil waitUntilDone:YES];
        
        CCSkeletonAnimation *animationNode = [CCSkeletonAnimation skeletonWithFile:@"loadinggame_ani.json" atlasFile:@"loadinggame_ani.atlas" scale:0.5];
        animationNode.timeScale = 1.0f;
        //animationNode.visible = NO;
        [animationNode setAnimation:@"yangziyouxiloading" loop:YES];
        // animationNode.anchorPoint = ccp(0,0);
        animationNode.position = ccp(512,384);
        [self addChild:animationNode ];
        //[self performSelector:@selector(waitLoad) withObject:nil afterDelay:5.0f];
    }
    return self;
}
-(void)waitLoad
{
    otherScene = [NSClassFromString(_targetSc) scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:otherScene]];

}
@end


//@implementation Loading
//+(id) scene
//{
//	// 'scene' is an autorelease object.
//	CCScene *scene = [CCScene node];
//	
//	// 'layer' is an autorelease object.
//	Loading *layer = [Loading node];
//	
//	// add layer as a child to scene
//	[scene addChild: layer];
//	
//	// return the scene
//	return scene;
//}
//-(id) init
//{
//	// always call "super" init
//	// Apple recommends to re-assign "self" with the "super" return value
//	if( (self=[super initWithColor:ccc4(179, 197, 61, 255)] )) {
//		CCSprite *sp = [CCSprite spriteWithFile:@"loading_bg.jpg"];
//        sp.anchorPoint = CGPointZero;
//        [self addChild:sp];
//        
//        CCSprite *sptx = [CCSprite spriteWithFile:@"loading_tx.jpg"];
//        sptx.position = ccp(531,265);
//        [sp addChild:sptx];
//        
//        
//		// ask director the the window size
//		//CGSize size = [[CCDirector sharedDirector] winSize];
//		
//		// position the label on the center of the screen
//
//		
//	}
//	return self;
//}
//
//-(void)logoFinish:(NSNotification*) aNotification
//{
//
//	
//}
//-(void)removed
//{
//	
//	[self unschedule:_cmd];
//    
//	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu scene]]];
//}
//-(void)addimage
//{
////	CGSize size = [[CCDirector sharedDirector] winSize];
////    
////	CCSprite *bg = [CCSprite spriteWithFile:@"logo1.png"];
////	bg.position =  ccp(  size.width/2, size.height/2 );
//////    bg.scaleX = 640/768.0f;
//////    bg.scaleY = 960/1024.0f;
//
//	
//}
//-(void)minzuLogo1
//{
////    CGSize size = [[CCDirector sharedDirector] winSize];
////	
////	//CCSprite *sp = (CCSprite*)[self getChildByTag:kTagLoadingBg+1];
////	//[sp runAction:[CCFadeOut actionWithDuration:1]];
////	[self removeChildByTag:kTagLoadingBg+1 cleanup:YES];
////	CCSprite *bg = [CCSprite spriteWithFile:@"Mingzu.jpg"];
////	bg.position =  ccp(  size.width/2, size.height/2 );
////	[self addChild:bg z:3];
////	bg.opacity = 0;
////	[bg runAction:[CCFadeIn actionWithDuration:1.0f]];
////	[NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(replace) userInfo:nil repeats:NO];
//}
//
//-(void)replace
//{
//
//	
//		[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu scene]]];
//	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[selectPageScene scene]]];
//	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[Game1 node]]];
//	
//}
//- (void) dealloc
//{
//	// in case you have something to dealloc, do it in this method
//	// in this particular example nothing needs to be released.
//	// cocos2d will automatically release all the children (Label)
//	
//	// don't forget to call "super dealloc"
//	[super dealloc];
//	//∂[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
//	//[[CCTextureCache sharedTextureCache] removeAllTextures];
//}
//
//@end
