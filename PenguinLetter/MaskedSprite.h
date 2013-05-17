//
//  MaskedSprite.h
//  MaskedCal2
//
//  Created by Ray Wenderlich on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface MaskedSprite : CCSprite {
    CCTexture2D * _maskTexture;
    GLuint	_textureLocation;
	GLuint	_maskLocation;
}

@end
