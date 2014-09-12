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
@property (nonatomic) SKSpriteNode *animateWalk;
@property (nonatomic, weak) SKAction *spriteAction;
@property (nonatomic, weak) SKAction *spriteSubAction;
@property (nonatomic, retain) SKTexture *spliffTexture;
@property NSMutableArray *walkTextures;
@property SKAction *walkAction;
@property SKSpriteNode *walk;
@property int count;
@property NSNumber *toggle;
-(SKAction*)repeat:(SKAction*)vidi tote:(SKSpriteNode*) action;
-(void)removeAnimation;
@end
