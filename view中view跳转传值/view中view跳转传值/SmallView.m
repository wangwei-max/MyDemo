//
//  SmallView.m
//  view中view跳转传值
//
//  Created by MAX on 16/6/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "SmallView.h"
#import "BigView.h"

@implementation SmallView

-(instancetype)initWithX:(CGFloat )X Y:(CGFloat )Y Maintext:(NSString *)Maintext Chlidtext:(NSString *)Chlidtext superViewW:(CGFloat )superViewW
{
    if (self) {
        [self removeFromSuperview];
        self = nil;
        self = [[SmallView alloc] init];
    }

    self.backgroundColor = [UIColor greenColor];
    CGFloat W = (superViewW - 3*10)/2;
//  NSLog(@"%f",self.superview.bounds.size.height);
    self.frame = CGRectMake(X, Y, W, 80);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"主%@－副%@",Maintext,Chlidtext];
    label.font = [UIFont systemFontOfSize:12];
    [self addSubview:label];
    NSLog(@"%f", self.superview.bounds.size.width);
    return self;
}

@end
