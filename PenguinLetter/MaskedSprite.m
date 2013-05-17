//
//  MaskedSprite.m
//  MaskedCal2
//
//  Created by Ray Wenderlich on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MaskedSprite.h"

@implementation MaskedSprite

- (id)initWithFile:(NSString *)file 
{
    self = [super initWithFile:file];
    if (self) {
        
        // 1
        _maskTexture = [[[CCTextureCache sharedTextureCache] addImage:@"mask80.png"] retain];
        
        // 2
        self.shaderProgram = [[[GLProgram alloc] 
          initWithVertexShaderFilename:@"Shaders/PositionTextureColor.vert"
          fragmentShaderFilename:@"Mask.frag"] autorelease];
        
        CHECK_GL_ERROR_DEBUG();
        
        // 3
        [_shaderProgram addAttribute:kCCAttributeNamePosition index:	kCCVertexAttrib_Position];
		[_shaderProgram addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
		[_shaderProgram addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
		
		CHECK_GL_ERROR_DEBUG();
		
        // 4
		[_shaderProgram link];
        
		CHECK_GL_ERROR_DEBUG();
		
        // 5
		[_shaderProgram updateUniforms];
        
		CHECK_GL_ERROR_DEBUG();                
        
        // 6
        _textureLocation = glGetUniformLocation( _shaderProgram->_program, "u_texture");
		_maskLocation = glGetUniformLocation( _shaderProgram->_program, "u_mask");
        
        CHECK_GL_ERROR_DEBUG();
        
    }
    
    return self;
}

@end
