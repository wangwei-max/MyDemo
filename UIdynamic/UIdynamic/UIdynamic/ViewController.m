//
//  ViewController.m
//  UIdynamic
//
//  Created by MAX on 16/6/15.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (nonatomic,strong) UIDynamicAnimator *animaotr;
@end

@implementation ViewController

-(UIDynamicAnimator *)animaotr
{
    if (!_animaotr) {
        //1.创建仿真器，（ReferenceView 为参照试图，也就是设置仿真范围）
         _animaotr = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _animaotr;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self teztSnap:touches];
}

//吸附行为
-(void)teztSnap: (NSSet<UITouch *> *)touches
{
    //获取触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.redView snapToPoint:point];

    [self.animaotr removeAllBehaviors];
    [self.animaotr addBehavior:snap];
    
}

-(void)textCollision
{
    //创建碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] init];
    
    //    //碰撞边界－是否在屏幕范围内碰撞回来
    //    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    //    添加边界
    //(线 可多加线)
    CGSize Screen =[UIScreen mainScreen].bounds.size;
    //    [collision addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, Screen.height *0.5) toPoint:CGPointMake(Screen.width*0.5, Screen.height *0.5)];
    
    //圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, Screen.width, Screen.height)];
    [collision addBoundaryWithIdentifier:@"circle" forPath:path];
    [collision addItem:self.yellowView];
    [collision addItem:self.blueView];
    [collision addItem:self.redView];
    
    
    //创建重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]init];
    [gravity addItem:self.blueView];
    
    //添加行为
    [self.animaotr addBehavior:collision];
    [self.animaotr addBehavior:gravity];
}
-(void)textGravity
{
    //2.创建物理仿真行为 －重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]init];
    gravity.gravityDirection = CGVectorMake(100, 100);
    gravity.angle = 1;
    [gravity addItem:self.blueView];
    //3.添加 重力仿真行为 到 仿真器
    [self.animaotr addBehavior:gravity];
}
@end
