//
//  C4WorkSpace.m
//  CodeSamples
//
//  A Cocoa For Artists project
//  Originally created by Travis Kirton.
//  Converted by Jordan Peterson on 12-03-23.
//  

#import "C4WorkSpace.h"

int canvasWidth, canvasHeight;
CGPoint centerPos;

C4Shape *regPoly;
int sides = 5;
float cRad = 150.0f;
float sagitta;
float proportion;

@implementation C4WorkSpace

-(void)setup {
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    centerPos = CGPointMake(canvasWidth/2, canvasHeight/2);
    
    sagitta = 2 * cRad * [C4Math square:[C4Math sin:PI/(2*sides)]];
    proportion = [C4Math cos:PI/sides];
    CGPoint regPolyPoints[sides+1];
    for (int i = 0; i <= sides; i++) {
        float angle = TWO_PI * i/sides;
        regPolyPoints[i].x = cRad * [C4Math cos:angle] + centerPos.x;
        regPolyPoints[i].y = cRad * [C4Math sin:angle] + centerPos.y;
    }
    
    regPoly = [C4Shape polygon:regPolyPoints pointCount:sides+1];
    regPoly.layer.anchorPoint = CGPointMake(regPoly.center.x, regPoly.center.y + sagitta);
    [self.canvas addShape:regPoly];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    regPoly.animationOptions = 10.0f;
    regPoly.animationOptions = LINEAR | REPEAT;
    regPoly.transform = CGAffineTransformMakeRotation(PI);
}

@end