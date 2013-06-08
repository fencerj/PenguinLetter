//
//  LoadingScene.m
//  eBookTest
//
//  Created by fencerj on 10-10-23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadingScene.h"
#import "MainMenu.h"
@implementation LoadingScene
+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LoadingScene *layer = [LoadingScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super initWithColor:ccc4(179, 197, 61, 255)] )) {
		
		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
		
		// position the label on the center of the screen

		
		NSError *setCategoryError = nil;
		[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
		if (setCategoryError) { 
			//handle error 
		} 
		MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc]
												initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"mov"]]];
		//初始化视频播放器对象，并传入被播放文件的地址
		moviePlayer.scalingMode =MPMovieScalingModeAspectFit;  //MPMovieScalingModeAspectFill;
		moviePlayer.endPlaybackTime = 3.5;
		//moviePlayer.movieControlMode = MPMovieControlModeDefault;
		moviePlayer.movieControlMode = MPMovieControlModeHidden;
		moviePlayer.useApplicationAudioSession = NO;
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(logoFinish:)
													 name:MPMoviePlayerPlaybackDidFinishNotification
												   object:moviePlayer];
		
		[moviePlayer.view setTransform:CGAffineTransformMakeRotation(0)];
        //CGSize size = [[CCDirector sharedDirector] winSize];

        
        moviePlayer.view.frame = CGRectMake(0, 512-250-100, 1024, 300);
        //moviePlayer.view.frame = CGRectMake(74, 512-250, 620, 200);
        //moviePlayer.view.center = ccp(size.width/2,size.height/2);
		[[[CCDirector sharedDirector] openGLView] addSubview:moviePlayer.view];
		
		[moviePlayer play];
		//[self schedule:@selector(addimage) interval:2.5];
	}
	return self;
}
-(void)canNext
{
	CCLOG(@"11");
}
-(void)logoFinish:(NSNotification*) aNotification
{
	MPMoviePlayerController* theMovie = [aNotification object];
	
	[[NSNotificationCenter defaultCenter]
	 removeObserver: self
	 name: MPMoviePlayerPlaybackDidFinishNotification
	 object: theMovie];
	// If the moviePlayer.view was added to the openGL view, it needs to be removed
	if ([theMovie respondsToSelector:@selector(setFullscreen:animated:)]) {
		[theMovie.view removeFromSuperview];
	}
	
	// Release the movie instance created in playMovieAtURL:
	[theMovie release];	
	[self removed];
	
}
-(void)removed
{
	
	[self unschedule:_cmd];
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu scene]]];
}
-(void)addimage
{
//	CGSize size = [[CCDirector sharedDirector] winSize];
//    
//	CCSprite *bg = [CCSprite spriteWithFile:@"logo1.png"];
//	bg.position =  ccp(  size.width/2, size.height/2 );
////    bg.scaleX = 640/768.0f;
////    bg.scaleY = 960/1024.0f;

	
}
-(void)minzuLogo1
{
//    CGSize size = [[CCDirector sharedDirector] winSize];
//	
//	//CCSprite *sp = (CCSprite*)[self getChildByTag:kTagLoadingBg+1];
//	//[sp runAction:[CCFadeOut actionWithDuration:1]];
//	[self removeChildByTag:kTagLoadingBg+1 cleanup:YES];
//	CCSprite *bg = [CCSprite spriteWithFile:@"Mingzu.jpg"];
//	bg.position =  ccp(  size.width/2, size.height/2 );
//	[self addChild:bg z:3];
//	bg.opacity = 0;
//	[bg runAction:[CCFadeIn actionWithDuration:1.0f]];
//	[NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(replace) userInfo:nil repeats:NO];
}

-(void)replace
{

	
		[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainMenu scene]]];
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[selectPageScene scene]]];
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[Game1 node]]];
	
}
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
	//∂[[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
	//[[CCTextureCache sharedTextureCache] removeAllTextures];
}

@end
