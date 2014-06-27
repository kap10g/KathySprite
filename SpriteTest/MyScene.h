//
//  MyScene.h
//  SpriteTest
//

//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "AnimateWalk.h"

@interface MyScene : SKScene
@property (nonatomic, readonly) SKEmitterNode *smoke;
@property (nonatomic, readonly) NSMutableArray *holder;
@property (nonatomic, readonly) NSMutableArray *Kathyholder;
@property (nonatomic, readonly) NSMutableArray *textureHolder;
@property (nonatomic, readonly) NSMutableArray *Spliffholder;
@property (nonatomic) AnimateWalk *animateWalk;
@property (nonatomic, weak) SKAction *spriteAction;
@property (nonatomic, weak) SKAction *spriteSubAction;
@property (nonatomic, retain) SKTexture *spliffTexture;
@property NSMutableArray *walkTextures;
@property int count;
@end
