#include <SpriteKit/SpriteKit.h>


@interface Archery :SKScene <SKPhysicsContactDelegate>
@property BOOL sceneCreated;
@property int score;
@property int ballCount;
@property NSArray *archerAnimation;
@end
