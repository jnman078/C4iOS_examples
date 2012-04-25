//
//  C4WorkSpace.m
//  CodeSamples
//
//  A Cocoa For Artists project
//  Originally created by Travis Kirton.
//  Converted by Jordan Peterson on 12-03-23.
//  

// hello

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    C4Shape *arm, *arm01;
    CGAffineTransform translate1, translate2;
    CGAffineTransform rotation1, rotation2;
    CGAffineTransform combo1, combo2, combo3;
    CGFloat x, y, angle1, angle2, segLength;
    CGPoint centerPos;
    int canvasWidth, canvasHeight;
}

-(void)setup {
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    centerPos = CGPointMake(canvasWidth/2.0f, canvasHeight/2.0f);
    
    x = 125.0f;
    y = centerPos.y;
    angle1 = 0.0f;
    angle2 = 0.0f;
    segLength = 200;
    
    self.canvas.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.05f];
    
    CGPoint linePoints[2] = {
        CGPointMake(0, 0),
        CGPointMake(segLength, 0)
    };
    
    arm = [C4Shape line:linePoints];
    arm.layer.anchorPoint = CGPointMake(0.0f, arm.bounds.size.height/2.0f);
    arm.lineWidth = 50.0f;
    arm.strokeColor = [UIColor colorWithWhite:1.0f alpha:0.33f];
    arm.lineCap = CAPROUND;
    [self.canvas addShape:arm];
    
    arm01 = [C4Shape line:linePoints];
    arm01.layer.anchorPoint = CGPointMake(0.0f, arm01.bounds.size.height/2.0f);
    arm01.lineWidth = 50.0f;
    arm01.strokeColor = [UIColor colorWithWhite:1.0f alpha:0.63f];
    arm01.lineCap = CAPROUND;
    [self.canvas addShape:arm01];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInView:self.canvas];
    angle1 = (touchPoint.x/canvasWidth-0.5f)*-1*(CGFloat)PI;
    angle2 = (touchPoint.y/canvasHeight-0.5f)*(CGFloat)PI;
    
    translate1 = CGAffineTransformMakeTranslation(x, y);
    translate2 = CGAffineTransformMakeTranslation(segLength, 0);
    rotation1 = CGAffineTransformMakeRotation(angle1);
    rotation2 = CGAffineTransformMakeRotation(angle2);
    
    combo1 = CGAffineTransformConcat(rotation1, translate1);
    combo2 = CGAffineTransformConcat(rotation2, translate2);
    combo3 = CGAffineTransformConcat(combo2, combo1);
    
    arm.transform = combo1;
    arm01.transform = combo3;
}

@end