//
//  MyScene.m
//  SpriteTest
//
//  Created by George Rosar on 5/29/14.
//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
@synthesize smoke, holder, Kathyholder, Spliffholder;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        holder = [[NSMutableArray alloc] init];
        Kathyholder = [[NSMutableArray alloc] init];
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
      

        
        myLabel.text = @"FART";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        NSString *smokePath = [[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"];
        smoke = [NSKeyedUnarchiver unarchiveObjectWithFile:smokePath];
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [smoke copy];
        
        SKSpriteNode *kathy = [SKSpriteNode spriteNodeWithImageNamed:@"kathy"];
        
        sprite.position = location;
        kathy.position = location;
        
        kathy.xScale = (CGFloat) random()/(CGFloat) RAND_MAX;
        kathy.yScale = (CGFloat) random()/(CGFloat) RAND_MAX;
        
        SKSpriteNode *spliff = [SKSpriteNode spriteNodeWithTexture:WALKING_TEX_CROP_1_LARGE];
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [kathy runAction:[SKAction repeatActionForever:action]];
        
        if ([holder count] > 4 || [Kathyholder count] > 4 || [Spliffholder count] > 4)
        {
            [[holder objectAtIndex:0] removeFromParent];
            [holder removeObject:0];
            [[Kathyholder objectAtIndex:0] removeFromParent];
            [Kathyholder removeObject:0];
            [[Spliffholder objectAtIndex:0] removeFromParent];
            [Spliffholder removeObject:0];
        }

        
        [holder addObject:sprite];
        [self addChild:sprite];
        [Kathyholder addObject:kathy];
        [self addChild:kathy];
        [Spliffholder addObject:spliff];
        [self addChild:spliff];
        CGFloat spliffScale = ((CGFloat) random()/(CGFloat) RAND_MAX) * 0.5;
        spliff.xScale = spliffScale;
        spliff.yScale = spliffScale;
        spliff.position = location;
        SKAction *walk = [SKAction animateWithTextures:WALKTHROUGH timePerFrame:0.033];
        [spliff runAction:walk];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
