//
//  LoadingView.m
//  DayDayCook
//
//  Created by GFeng on 15/11/2.
//  Copyright (c) 2015年 GFeng. All rights reserved.
//

#import "LoadingView.h"
@interface LoadingView()

@property (strong, nonatomic) UIImageView *loadingImg1;
@property (strong, nonatomic) UIImageView *loadingImg2;
@property (strong, nonatomic) UIImageView *loadingImg3;
@end



@implementation LoadingView



- (UIImageView *)loadingImg1
{
    UIImageView *loadingImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 72, 72)];;
    loadingImg1.image = [UIImage imageNamed:@"loadingIcon"];
    loadingImg1.backgroundColor = [UIColor clearColor];
    loadingImg1.layer.borderColor = [UIColor clearColor].CGColor;
    loadingImg1.layer.borderWidth = 1.0f;
    loadingImg1.layer.cornerRadius = 36.0f;
    loadingImg1.layer.masksToBounds = YES;
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 100000;
    [loadingImg1.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [self addSubview:_loadingImg1 = loadingImg1];
    
    return _loadingImg1;
}

- (UIImageView *)loadingImg2
{
    UIImageView *loadingImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 52, 52)];
    loadingImg2.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"loadingIcon3"],[UIImage imageNamed:@"loadingIcon4"],nil];
    loadingImg2.backgroundColor = [UIColor clearColor];
    [loadingImg2 setAnimationDuration:1];
    [loadingImg2 setAnimationRepeatCount:0];
    [loadingImg2 startAnimating];
    loadingImg2.backgroundColor = [UIColor clearColor];
    [self addSubview:_loadingImg2 = loadingImg2];
    
    return _loadingImg2;
}

- (UIImageView *)loadingImg3
{
    UIImageView *loadingImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 82, 25)];
    loadingImg3.image = [UIImage imageNamed:@"loadingIcon2"];
    loadingImg3.contentMode = UIViewContentModeCenter;
    loadingImg3.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self addSubview:_loadingImg3 = loadingImg3];
    loadingImg3.backgroundColor = [UIColor clearColor];
    return _loadingImg3;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        
        
        [self loadingImg1];
        [self loadingImg2];
        [self loadingImg3];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
