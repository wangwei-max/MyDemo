//
//  ViewController.m
//  UIView动画
//
//  Created by MAX on 16/5/12.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageV = [[UIImageView alloc] init];
    _imageV.frame = CGRectMake(100, 100, 50, 50);
    _imageV.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:_imageV];
    
    UIButton *moveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    moveBtn.frame  = CGRectMake(120, 360, 80, 40);
    [moveBtn setTitle:@"move" forState:UIControlStateNormal];
    [moveBtn addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moveBtn];
    
//    设置缩放按钮
    
    UIButton *scaleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    scaleBtn.frame  = CGRectMake(120, 400, 80, 40);
    [scaleBtn setTitle:@"缩放" forState:UIControlStateNormal];
    [scaleBtn addTarget:self action:@selector(scale) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scaleBtn];
}


-(void)move
{
    NSLog(@"move");
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //动画的实际结果目标
    [UIView setAnimationDuration:2];//设置动画时间（秒）
    [UIView setAnimationDelay:0];//设置动画的开始延长（秒）
    [UIView setAnimationDelegate:self];//设置动画的代理；
    [UIView setAnimationDidStopSelector:@selector(stopAnima)];//设置动画结束的事件
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];//移动加速or匀速
    _imageV.frame = CGRectMake(200, 100, 80, 80);//设置目标位置
    _imageV.image = [UIImage imageNamed:@"2"];
    //提交动画
    [UIView commitAnimations];
}


-(void)scale
{
    NSLog(@"缩放");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    _imageV.frame = CGRectMake(200, 100, 120, 120);
    [UIView commitAnimations];
    [self small];
    
}

-(void)small
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    _imageV.frame = CGRectMake(200, 100, 50, 50);
    [UIView commitAnimations];
}

-(void)stopAnima
{
    NSLog(@"移动结束");
}@end
