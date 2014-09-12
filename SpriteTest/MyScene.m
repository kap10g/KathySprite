//
//  MyScene.m
//  SpriteTest
//
//  Created by George Rosar on 5/29/14.
//  Copyright (c) 2014 George Rosar. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
@synthesize smoke, holder, Kathyholder, Spliffholder, animateWalk, spriteAction, spliffTexture, count, spriteSubAction, walkAction, walk;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        holder = [[NSMutableArray alloc] init];
        Kathyholder = [[NSMutableArray alloc] init];
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
      
        count = 0;
        
        myLabel.text = @"FART";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        NSString *smokePath = [[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"];
        smoke = [NSKeyedUnarchiver unarchiveObjectWithFile:smokePath];
        [self addChild:myLabel];
        
        SKTextureAtlas *walkAtlas = [SKTextureAtlas atlasNamed:@"walking"];
        NSArray *textureNames = [walkAtlas textureNames];
        _walkTextures = [NSMutableArray new];
        for (NSString *name in textureNames) {
            SKTexture *texture = [walkAtlas textureNamed:name];
            [_walkTextures addObject:texture];
        }
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        count++;
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [smoke copy];
        SKSpriteNode *kathy = [SKSpriteNode spriteNodeWithImageNamed:@"kathy"];
        
        sprite.position = location;
        kathy.position = location;
        
        kathy.xScale = (CGFloat) random()/(CGFloat) RAND_MAX;
        kathy.yScale = (CGFloat) random()/(CGFloat) RAND_MAX;
        
        
        //animateWalk = [[AnimateWalk alloc] init];
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [kathy runAction:[SKAction repeatActionForever:action]];
        
        CGFloat spliffScale = ((CGFloat) random()/(CGFloat) RAND_MAX) * 0.5;
        
        walk = [SKSpriteNode spriteNodeWithTexture:[_walkTextures objectAtIndex:0]];
        walk.zPosition = 100;
        walk.scale = spliffScale;
        walk.position = location;
        
        [self addChild:walk];
        
        walkAction = [SKAction repeatActionForever:[SKAction animateWithTextures:_walkTextures timePerFrame:0.03]];
        
        [walk runAction:[SKAction sequence:@[walkAction]]];
        
        if ([holder count] > 0)
        {
            NSLog(@"Too long");
            SKSpriteNode *holderSprite = [holder objectAtIndex:0];
            [holder removeObject:holderSprite];
            [holderSprite removeFromParent];
            SKSpriteNode *kathySprite = [Kathyholder objectAtIndex:0];
            [Kathyholder removeObject:kathySprite];
            [kathySprite removeFromParent];
            SKSpriteNode *spliffSprite = [Spliffholder objectAtIndex:0];
            [Spliffholder removeObject:spliffSprite];
            [Spliffholder objectAtIndex:0];
            [spliffSprite removeAllActions];
            [spliffSprite removeFromParent];
            SKAction *tmpGhost = [SKAction removeFromParent];
            [spliffSprite runAction:tmpGhost];
            [self removeAnimation];
            SKAction *remove = [SKAction removeFromParent];
            [walk runAction:[SKAction sequence:@[remove]]];
            
        }

        
        [holder addObject:sprite];
        [self addChild:sprite];
        [Kathyholder addObject:kathy];
        [self addChild:kathy];

    }
}

-(void)removeAnimation
{
    [walk removeAllActions];
    walkAction = nil;
}

-(SKAction*)repeat:(SKAction*)vidi tote:(SKSpriteNode*)action
{
    
    return vidi;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
