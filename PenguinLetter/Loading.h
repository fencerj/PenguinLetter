//
//  LoadingScene.h
//  eBookTest
//
//  Created by fencerj on 10-10-23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "cocos2d.h"
#import <MediaPlayer/MediaPlayer.h>
@interface Loading : CCLayerColor {
    NSString* _targetSc;
    CCScene *otherScene;
}
+(id)initWithTargetScene:(NSString*)targetSc;
-(id)initScene:(NSString*)targetSc;
-(void)waitLoad;
//-(void)removed;
//+(id) scene;
@end
