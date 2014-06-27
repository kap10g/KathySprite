//
//  AnimateWalk.m
//  SpriteTest
//
//  Created by George Rosar on 6/27/14.
//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import "AnimateWalk.h"


@implementation AnimateWalk
@synthesize theAction, theTexture;
-(id) init
{
    self = [super init];
    if (self)
    {
        self = [AnimateWalk spriteNodeWithTexture:WALKING_TEX_CROP_1_LARGE];
        theAction = [SKAction repeatAction:[SKAction animateWithTextures:WALKTHROUGH timePerFrame:0.03] count:1];
        [self runAction:theAction];
        NSLog(@"here");
    }
    return self;
}
-(void) stopAction
{
    [self removeAllChildren];
    [self removeAllActions];
    theAction = [[SKAction init] alloc];
    self.texture = nil;
    NSLog(@"%d", self.hasActions);
    [self removeFromParent];
    SKAction *remove = [SKAction removeFromParent];
    [self runAction:remove];
}
@end
