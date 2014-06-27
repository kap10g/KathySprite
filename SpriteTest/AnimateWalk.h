//
//  AnimateWalk.h
//  SpriteTest
//
//  Created by George Rosar on 6/27/14.
//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "walking.h"

@interface AnimateWalk : SKSpriteNode
@property(strong) SKAction *theAction;
@property(strong) SKTexture *theTexture;
@property NSMutableArray *explosionTextures;
-(id) init;
-(void) stopAction;
@end
