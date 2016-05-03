//
//  NetworkLoadView.m
//  DayDayCook
//
//  Created by GFeng on 16/3/2.
//  Copyright © 2016年 GFeng. All rights reserved.
//

#import "NetworkLoadView.h"
@interface NetworkLoadView()

@property (strong, nonatomic) UIImageView *bgImg;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UIButton *reloadBtn;
@end


@implementation NetworkLoadView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = COLOR(253, 250, 249, 1);
        
        [self bgImg];
        [self contentLabel];
        [self reloadBtn];
    }
    return self;
}
- (UIImageView *)bgImg
{
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH - 103)/2, (self.frame.size.height - 108)/2 - 100, 103, 108 )];
    bgImg.image = [UIImage imageNamed:@"networkerror"];
    bgImg.contentMode = UIViewContentModeCenter;
    [self addSubview:bgImg];
    [self addSubview:_bgImg = bgImg];
    
    return _bgImg;
}
- (UILabel *)contentLabel
{
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake((DEVICE_WIDTH - 220)/2, _bgImg.frame.origin.y + 128, 220, 40)];
    contentLabel.text = @"网络连接失败，请检查您的网络设置，再重新加载。";
    contentLabel.textColor = COLOR(146, 146, 146, 1);
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 2;
    contentLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_contentLabel = contentLabel];
    
    return _contentLabel;
}
- (UIButton *)reloadBtn
{
    UIButton *reloadBtn = [UIButton buttonWithType:0];
    reloadBtn.frame = CGRectMake((DEVICE_WIDTH - 220)/2, _bgImg.frame.origin.y + 188, 220, 40);
    [reloadBtn setImage:[UIImage imageNamed:@"reload"] forState:0];
//    [reloadBtn setImage:[UIImage imageNamed:@"reload_on"] forState:UIControlStateHighlighted];
    [reloadBtn addTarget:self action:@selector(reloadRequestUrl) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reloadBtn = reloadBtn];
    
    return _reloadBtn;
}
-(void)reloadRequestUrl{
    if ([self.delegate respondsToSelector:@selector(reloadRequestClick)]) {
        [self.delegate reloadRequestClick];
    }
}


@end
