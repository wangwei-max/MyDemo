//
//  WWStatusBarHUB.m
//  状态栏指示器
//
//  Created by MAX on 16/6/14.
//  Copyright © 2016年 MAX. All rights reserved.
//

#define WWFont [UIFont systemFontOfSize:12]
#define ScreenW [UIScreen mainScreen].bounds.size.width
#import "WWStatusBarHUB.h"


/**消息显示／隐藏的动画时间*/
static CGFloat const WWAninmationDuration = 0.25;

@implementation WWStatusBarHUB

static UIWindow *window_;

static NSTimer *timer;


+(void)setupWindow
{
    //停止定时器
    [timer invalidate];
    timer = nil;
    
    //frame 数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    window_.frame = frame;
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:WWAninmationDuration animations:^{
        window_.frame = frame;
    }];
}


/**
 * 显示普通信息
 *  @param msg   文字
 *  @param image 图片
 */
+(void)show:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer invalidate];
    
    //显示窗口
    [self setupWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = WWFont;
    if (image) { //如果有图片
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button setImage:image forState:UIControlStateNormal];
    }
    
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


/**
 * 显示普通信息
 */
+(void)showMessage:(NSString *)msg
{
    [self show:msg image:nil];
}

/**
 * 显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    [self show:msg image:[UIImage imageNamed:@"WWstatusBarHUB.bundle/check"]];
}

/**
 * 显示失败信息
 */
+(void)showError:(NSString *)msg
{
    [self show:msg image:[UIImage imageNamed:@"WWstatusBarHUB.bundle/error"]];
}

/**
 * 显示正在处理信息
 */
+(void)showLoading:(NSString *)msg
{
    [self setupWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = WWFont;
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : WWFont}].width;
    CGFloat centerX  = (ScreenW - msgW) *0.5 -10 ;
    CGFloat centerY = window_.frame.size.height * 0.5 ;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];

}

/**
 * 隐藏
 */
+(void)hide
{
    [UIView animateWithDuration:WWAninmationDuration animations:^{
        CGRect frame =  window_.frame;
        frame.origin.y = -window_.frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer = nil;
    }];
    
}

@end

