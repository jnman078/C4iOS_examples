//
//  C4WorkSpace.m
//  AnimationCurves
//
//  Created by Jordan Peterson on 12-04-12.
//  Copyright (c) 2012 ACAD. All rights reserved.
//

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    C4Font *font;
    C4Shape *ball1, *ball2, *ball3, *ball4;
    C4Label *label1, *label2, *label3, *label4;
    CGAffineTransform path;
    int canvasWidth, canvasHeight;
}

-(void)setup {
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    self.canvas.backgroundColor = [UIColor darkGrayColor];
    font = [C4Font fontWithName:@"arial" size:30.0f];
    
    // Balls that have been set to different animation modes.
    ball1 = [C4Shape ellipse:CGRectMake(39, 20, 150, 150)];
    ball1.strokeColor = [UIColor colorWithRed:0.9f green:0.0f blue:0.0f alpha:1.0f];
    ball1.fillColor = [UIColor redColor];
    [self.canvas addShape:ball1];
    
    ball2 = [C4Shape ellipse:CGRectMake(219, 20, 150, 150)];
    ball2.strokeColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.0f alpha:1.0f];
    ball2.fillColor = [UIColor yellowColor];
    [self.canvas addShape:ball2];
    
    ball3 = [C4Shape ellipse:CGRectMake(399, 20, 150, 150)];
    ball3.strokeColor = [UIColor colorWithRed:0.0f green:0.9f blue:0.0f alpha:1.0f];
    ball3.fillColor = [UIColor greenColor];
    [self.canvas addShape:ball3];
    
    ball4 = [C4Shape ellipse:CGRectMake(579, 20, 150, 150)];
    ball4.strokeColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.9f alpha:1.0f];
    ball4.fillColor = [UIColor blueColor];
    [self.canvas addShape:ball4];
    
    //  Labels for the different animation modes.
    label1 = [C4Label labelWithText:@"LINEAR" andFont:font];
    label1.origin = CGPointMake(ball1.frame.origin.x, canvasHeight - 40.0f);
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = ALIGNTEXTCENTER;
    [self.canvas addLabel:label1];
    
    label2 = [C4Label labelWithText:@"EASEIN" andFont:font];
    label2.origin = CGPointMake(ball2.frame.origin.x, canvasHeight - 40.0f);
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = ALIGNTEXTCENTER;
    [self.canvas addLabel:label2];
    
    label3 = [C4Label labelWithText:@"EASEOUT" andFont:font];
    label3.origin = CGPointMake(ball3.frame.origin.x, canvasHeight - 40.0f);
    label3.textColor = [UIColor whiteColor];
    label3.textAlignment = ALIGNTEXTCENTER;
    [self.canvas addLabel:label3];
    
    label4 = [C4Label labelWithText:@"EASEINOUT" andFont:font];
    label4.origin = CGPointMake(ball4.frame.origin.x, canvasHeight - 40.0f);
    label4.textColor = [UIColor whiteColor];
    label4.textAlignment = ALIGNTEXTCENTER;
    [self.canvas addLabel:label4];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    ball1.animationDuration = 2.5f;
    ball1.animationOptions = LINEAR | AUTOREVERSE;
    ball1.transform = CGAffineTransformMakeTranslation(0.0f, 3*canvasHeight/4);
    
    ball2.animationDuration = 2.5f;
    ball2.animationOptions = EASEIN | AUTOREVERSE;
    ball2.transform = ball1.transform;
    
    ball3.animationDuration = 2.5f;
    ball3.animationOptions = EASEOUT | AUTOREVERSE;
    ball3.transform = ball1.transform;
    
    ball4.animationDuration = 2.5f;
    ball4.animationOptions = EASEINOUT | AUTOREVERSE;
    ball4.transform = ball1.transform;
}

@end
