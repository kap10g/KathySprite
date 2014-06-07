//
//  Archery.m
//  SpriteTest
//
//  Created by George Rosar on 5/31/14.
//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import "Archery.h"


@implementation Archery : SKScene

static const uint32_t arrowCategory = 0x1 << 0;
static const uint32_t ballCategory = 0x1 << 1;

- (void) createBallNode
{
    SKSpriteNode *ball = [[SKSpriteNode alloc]
                          initWithImageNamed:@"BallTexture.png"];
    
    ball.position = CGPointMake(randomBetween(200, self.size.width),
                                self.size.height-50);
    
    ball.name = @"ballNode";
    ball.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:(ball.size.width/2)-7];
    ball.physicsBody.usesPreciseCollisionDetection = YES;
    ball.physicsBody.categoryBitMask = ballCategory;
    
    [self addChild:ball];
}

- (void) initArcheryScene
{
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    SKSpriteNode *archerNode = [self createArcherNode];
    
    archerNode.position =
    CGPointMake(CGRectGetMinX(self.frame)+55,
                CGRectGetMidY(self.frame));
    
    [self addChild:archerNode];
}

- (SKSpriteNode *) createArrowNode
{
    SKSpriteNode *arrow =
    [[SKSpriteNode alloc] initWithImageNamed:@"ArrowTexture.png"];
    
    arrow.position = CGPointMake(CGRectGetMinX(self.frame)+100,
                                 CGRectGetMidY(self.frame));
    
    arrow.name = @"arrowNode";
    
    arrow.physicsBody =
    [SKPhysicsBody bodyWithRectangleOfSize:arrow.frame.size];
    arrow.physicsBody.usesPreciseCollisionDetection = YES;
    arrow.physicsBody.categoryBitMask = arrowCategory;
    arrow.physicsBody.collisionBitMask = arrowCategory | ballCategory;
    arrow.physicsBody.contactTestBitMask =
    arrowCategory | ballCategory;
    
    return arrow;
}

- (void)didMoveToView:(SKView *)view
{
    if (!self.sceneCreated)
    {
        self.score = 0;
        self.ballCount = 40;
        self.physicsWorld.gravity = CGPointVectori(0, -1.0);
        self.physicsWorld.contactDelegate = self;
        [self initArcheryScene];
        self.sceneCreated = YES;
    }
}

- (void) didBeginContact:(SKPhysicsContact *)contact
{
    SKSpriteNode *firstNode, *secondNode;
    
    firstNode = (SKSpriteNode *)contact.bodyA.node;
    secondNode = (SKSpriteNode *) contact.bodyB.node;
    
    if ((contact.bodyA.categoryBitMask == arrowCategory)
        && (contact.bodyB.categoryBitMask == ballCategory))
    {
        CGPoint contactPoint = contact.contactPoint;
        
        float contact_x = contactPoint.x;
        float contact_y = contactPoint.y;
        float target_y = secondNode.position.y;
        
        float margin = secondNode.frame.size.height/2 - 25;
        
        if ((contact_y > (target_y - margin)) &&
            (contact_y < (target_y + margin)))
        {
            SKPhysicsJointFixed *joint =
            [SKPhysicsJointFixed jointWithBodyA:contact.bodyA
                                          bodyB:contact.bodyB
                                         anchor:CGPointMake(contact_x, contact_y)];
            
            [self.physicsWorld addJoint:joint];
            
            SKTexture *texture =
            [SKTexture textureWithImageNamed:@"ArrowHitTexture"];
            firstNode.texture = texture;
            self.score++;
        }
    }
}

@end

