//
//  C4WorkSpace.m
//  StoringInput
//
//  A Cocoa For Artists project
//  Created by Jordan Peterson on 12-05-01.
//  Copyright (c) 2012 ACAD. All rights reserved.
//  

////////////////////////////////////////////////////////////////
// The MYFADER class
////////////////////////////////////////////////////////////////

@interface MyFader : C4Shape 

-(id)initWithFrame:(CGRect)frame;
-(void)ellipse:(CGRect)rect;
-(void)render;

@end

@implementation MyFader

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self != nil) {
        self.animationDuration = 0.0f;
        self.fillColor = [UIColor yellowColor];
        self.strokeColor = [UIColor clearColor];
    }
    return self;
}

-(void)ellipse:(CGRect)rect {
    [super ellipse:rect];
    //    self.fillColor = [UIColor purpleColor];
    [self performSelector:@selector(render) withObject:nil afterDelay:1.0f];
}

-(void)render {
    self.animationDuration = 2.0f;
    self.strokeColor = [UIColor clearColor];
    self.fillColor = [UIColor clearColor];
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:2.05f];
}

@end

////////////////////////////////////////////////////////////////
// The WORKSPACE
////////////////////////////////////////////////////////////////

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    MyFader *thing;
    CGPoint touchPoint;
    float orbDiameter;
}

-(void)setup {
    self.canvas.backgroundColor = [UIColor darkGrayColor];
    orbDiameter = 120.0f;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    touchPoint = [[touches anyObject] locationInView:self.canvas];
    thing = [[MyFader alloc] initWithFrame:CGRectMake(touchPoint.x-orbDiameter/2, touchPoint.y-orbDiameter/2, orbDiameter, orbDiameter)];
    [thing ellipse:thing.frame];
    //    thing.fillColor = [UIColor colorWithHue:0.5f saturation:1.0f brightness:1.0f alpha:1.0f];
    //    thing.fillColor = [UIColor colorWithHue:0.8f saturation:1.0f brightness:0.8f alpha:0.5f];
    thing.strokeColor = [UIColor clearColor];
    [self.canvas addShape:thing];
}

@end
