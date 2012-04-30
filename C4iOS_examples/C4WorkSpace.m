//
//  C4WorkSpace.m
//  CodeSamples
//
//  A Cocoa For Artists project
//  Originally created by Travis Kirton.
//  Converted by Jordan Peterson on 12-03-23.
//  

////////////////////////////////////////////////////////////////
// The PARTICLE object
////////////////////////////////////////////////////////////////

@interface Particle : C4Shape {
    C4Shape *orb;
}

-(id)initAtPosition:(CGPoint)pos;

-(void)draw;

@end

@implementation Particle

-(id)init {
    return [self initAtPosition:CGPointMake(0.0f, 0.0f)];
}

-(id)initAtPosition:(CGPoint)pos {
    self = [super init];
    if(self != nil) {
        //
    }
    return self;
}

-(void)draw {
    [self ellipse:self.frame];
    self.fillColor = [UIColor colorWithHue:0.0f saturation:1.0f brightness:1.0f alpha:1.0f];
}

@end

////////////////////////////////////////////////////////////////
// The WORKSPACE
////////////////////////////////////////////////////////////////

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    NSMutableArray *mArr;
    Particle *thing;
    C4Shape *orb;
    CGAffineTransform translate;
    CGPoint centerPos;
    int canvasWidth, canvasHeight;
    //int orbWidth, orbHeight;
    int count;
}

-(void)setup {
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    centerPos = CGPointMake(canvasWidth/2.0f, canvasHeight/2.0f);
    count = 19;
    
    thing = [Particle new];
    mArr = [[NSMutableArray alloc] initWithCapacity:0];
    [orb ellipse:CGRectMake(centerPos.x - 75, centerPos.y - 75, 150, 150)];
    orb.fillColor = [UIColor colorWithHue:0.0f saturation:1.0f brightness:1.0f alpha:1.0f];
    
    [thing listenFor:@"touchesBegan" andRunMethod:@"draw"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInView:self.canvas];
    float angle = [C4Math randomInt:(int)TWO_PI];
    for (int i = [mArr count]; i >= 0; i--) {
        thing = [mArr objectAtIndex:i];
        
        [thing draw];
        [mArr addObject:[[Particle alloc] initAtPosition:touchPoint]];
        
        //  Each orb goes in a random direction from the center for 2 seconds and slowly fades away.
        orb.animationDuration = 2.0f;
        orb.animationOptions = EASEOUT;
        orb.fillColor = [UIColor colorWithHue:0.0f saturation:1.0f brightness:1.0f alpha:0.0f];
        float x = [C4Math randomInt:(int)0.2f] * 50.0f * [C4Math cos:angle];
        float y = [C4Math randomInt:(int)0.2f] * 50.0f * [C4Math sin:angle];
        
        translate = CGAffineTransformMakeTranslation(x, y);
        orb.transform = translate;
        
        //  When an orb fades away, it gets removed from the array.
        //        if (<#condition#>) {
        //            [mArr removeObject:orb];
        //        }
    }
}

@end
