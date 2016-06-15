//
//  ViewController.m
//  触碰获取颜色的rgb
//
//  Created by 马悦 on 16/6/15.
//  Copyright © 2016年 马悦. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (nonatomic, strong) UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为myImageView添加滑动手势
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100.0/375*[[UIScreen mainScreen] bounds].size.width, 100.0/667*[[UIScreen mainScreen] bounds].size.height, 100.0/375*[[UIScreen mainScreen] bounds].size.width, 100.0/667*[[UIScreen mainScreen] bounds].size.height)];
    myImageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:myImageView];
    self.myImageView = myImageView;
}

//当有一个或多个手指触摸事件在当前视图或window窗体中响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    point.x = point.x - 100.0/375*[[UIScreen mainScreen] bounds].size.width;
    point.y = point.y - 100.0/667*[[UIScreen mainScreen] bounds].size.height;
     [self colorOfPoint:point];
    NSLog(@"touch (x, y) is (%f, %f)", point.x, point.y);
}

- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self.myImageView];
    NSLog(@"%f,%f",translation.x,translation.y);
    [self colorOfPoint:translation];
}

- (UIColor *)colorOfPoint:(CGPoint)point {
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    
    CGContextTranslateCTM(context, -point.x, -point.y);
    
    [self.myImageView.layer renderInContext:context];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIColor *color = [UIColor colorWithRed:pixel[0]/255.0 green:pixel[1]/255.0 blue:pixel[2]/255.0 alpha:pixel[3]/255.0];
    self.view.backgroundColor = color;
    return color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
