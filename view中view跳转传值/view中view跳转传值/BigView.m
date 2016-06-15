//
//  BigView.m
//  view中view跳转传值
//
//  Created by MAX on 16/6/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "BigView.h"
#import "SmallView.h"
@implementation BigView

-(instancetype)initWithLabelText:(NSString *)LabelText X:(CGFloat )X  Y:(CGFloat )Y
{
    if (self) {
        [self removeFromSuperview];
        self = nil;
        self = [[BigView alloc] init];
       
    }
    
    self.frame = CGRectMake(X, Y, ([UIScreen mainScreen].bounds.size.width-10*3)/2, 150);
    self.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.bounds.size.width-100)/2, 10, 100, 30)];
    label.text = LabelText;
    label.textAlignment = NSTextAlignmentCenter;
    
    
    CGFloat magin = 10;
    CGFloat SmallViewY = magin*2 +30;
    CGFloat SmallViewW = (self.bounds.size.width - 3*magin)/2;
    for (int i = 0 ; i<2; i++) {
        BOOL isLeft = i%2? NO : YES;
        CGFloat SmallViewX = isLeft ? magin : magin+i*(SmallViewW+magin);
        SmallView *sView = [[SmallView alloc] initWithX:SmallViewX Y:SmallViewY Maintext:LabelText Chlidtext:[NSString stringWithFormat:@"D%d",i+1] superViewW:self.bounds.size.width];
        [self addSubview:sView];
    }
    [self addSubview:label];
    return self;
}

@end
