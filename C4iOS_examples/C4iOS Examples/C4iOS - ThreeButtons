//
//  C4WorkSpace.m
//  CodeSamples
//
//  A Cocoa For Artists project
//  Originally created by Travis Kirton.
//  Converted by Jordan Peterson on 12-03-23.
//  

#import "C4WorkSpace.h"
#import "MyButton.h"

int canvasWidth, canvasHeight;
CGPoint centerPos;

MyButton *button1, *button2, *button3;
CGFloat buttonWidth = 200.0f;
CGFloat buttonHeight = 200.0f;
BOOL bgIsWhite, bgIsGray, bgIsBlack;

@implementation C4WorkSpace

-(void)setup {
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    centerPos = CGPointMake(canvasWidth/2, canvasHeight/2);
    bgIsBlack = YES;
    bgIsGray = NO;
    bgIsWhite = NO;
    
    button1 = [MyButton new];
    button2 = [MyButton new];
    button3 = [MyButton new];
    
    [button1 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, 80, buttonWidth, buttonHeight)];
    button1.strokeColor = [UIColor darkGrayColor];
    button1.fillColor = [UIColor blackColor];
    [self.canvas addShape:button1];
    
    [button2 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, centerPos.y - buttonHeight/2.0f, buttonWidth, buttonHeight)];
    button2.strokeColor = [UIColor darkGrayColor];
    button2.fillColor = [UIColor grayColor];
    [self.canvas addShape:button2];
    
    [button3 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, canvasHeight - 280, buttonWidth, buttonHeight)];
    button3.strokeColor = [UIColor darkGrayColor];
    button3.fillColor = [UIColor whiteColor];
    [self.canvas addShape:button3];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [button1 listenFor:@"touchesBegan" fromObject:button1 andRunMethod:@"methodA"];
    [button2 listenFor:@"touchesBegan" fromObject:button2 andRunMethod:@"methodB"];
    [button3 listenFor:@"touchesBegan" fromObject:button3 andRunMethod:@"methodC"];
    
    [button1 ellipse:CGRectMake(centerPos.x - buttonWidth/2.0f, 80, buttonWidth, buttonHeight)];
    [button2 ellipse:CGRectMake(centerPos.x - buttonWidth/2.0f, centerPos.y - buttonHeight/2.0f, buttonWidth, buttonHeight)];
    [button3 ellipse:CGRectMake(centerPos.x - buttonWidth/2.0f, canvasHeight - 280, buttonWidth, buttonHeight)];
    
    if (bgIsBlack) {
        self.canvas.backgroundColor = [UIColor blackColor];
        bgIsGray = NO;
        bgIsWhite = NO;
    }
    if (bgIsGray) {
        self.canvas.backgroundColor = [UIColor grayColor];
        bgIsBlack = NO;
        bgIsWhite = NO;
    }
    if (bgIsWhite) {
        self.canvas.backgroundColor = [UIColor whiteColor];
        bgIsBlack = NO;
        bgIsGray = NO;
    }
}

@end