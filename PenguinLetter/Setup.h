//
//  Setup.h
//  PenguinLetter
//
//  Created by Ivan on 13-6-8.
//  Copyright 2013年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "spine-cocos2d-iphone.h"
#import "Loading.h"
#import "MainMenu.h"
@interface Setup : CCLayer {
    CCSkeletonAnimation *animationNode;
    CCSprite  *pic;
}
+(CCScene *) scene;
@end
