//
//  FirstViewController.m
//  导航控制器动画
//
//  Created by MAX on 16/5/12.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()
{
    UIImageView *_imageV;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 330,480)];
               //(40, 40, 260,380)];
    _imageV.image = [UIImage imageNamed:@"1"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_imageV];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //控制器跳转动画
    //定义一个动画变换对象
    CATransition *amin = [CATransition animation];//初始化
    amin.duration = 1;//设置动画的时间长度；
    amin.type = @"cube";//设置动画类型，决定动画的效果类型（字符串）；
    
    //    amin.type = @"reveal";//拉出消失
    //    amin.type = @"pageCurl";//翻页（上翻页）
    //    amin.type = @"pageUnCurl";//翻页（下翻页）
    //    amin.type = @"suckEffect";//吸入效果
        amin.type = @"rippleEffect";//水波纹
    
    amin.subtype = kCATransitionFromRight;//设置动画的子类型，例如动画的方向；
    //设置动画的轨迹
    amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
    
    SecondViewController *sVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:sVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
