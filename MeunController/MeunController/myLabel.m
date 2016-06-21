//
//  myLabel.m
//  MeunController
//
//  Created by MAX on 16/6/21.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "myLabel.h"

@implementation myLabel

-(void)awakeFromNib
{
    [self setup];
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.userInteractionEnabled = YES;
//    [self addGestureRecognizer:[UITapGestureRecognizer alloc] i]
}

/**让label有资格成为第一响应者*/
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
/**label能执行那些操作（比如copy，paste）*/
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
//    NSLog(@"%@",NSStringFromSelector(action));
//    if (action == @selector(cut:) || action == @selector(copy:) ) {
//        return YES;
//    }
    return NO;
}


-(void)cut:(UIMenuController *)menu
{
    //放到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
    
    //清空文字
    self.text = nil;
}
-(void)copy:(id)sender
{
    NSLog(@"%s",__func__);
}


@end
