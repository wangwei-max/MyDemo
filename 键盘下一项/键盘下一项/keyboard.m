//
//  keyboard.m
//  键盘下一项
//
//  Created by MAX on 16/5/24.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "keyboard.h"

@implementation keyboard

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)tool
{
    return [[[NSBundle mainBundle] loadNibNamed:@"keyboard" owner:nil options:nil]firstObject];
}

- (IBAction)upBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(keyboardDidClickupItem:)]) {
        [self.delegate keyboardDidClickupItem:self];
    }
}
- (IBAction)downBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(keyboardDidClickdownItem:)]) {
        [self.delegate keyboardDidClickdownItem:self];
    }
    
}
- (IBAction)doneBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(keyboardDidClickdoneItem:)]) {
        [self.delegate keyboardDidClickdoneItem:self];
    }
    
}


@end
