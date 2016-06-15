//
//  keyboard.h
//  键盘下一项
//
//  Created by MAX on 16/5/24.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class keyboard;
@protocol keyboardDelegate <NSObject>

@optional
-(void)keyboardDidClickupItem:(keyboard *)tool;
-(void)keyboardDidClickdownItem:(keyboard *)tool;
-(void)keyboardDidClickdoneItem:(keyboard *)tool;
@end


@interface keyboard : UIToolbar
+(instancetype)tool;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *upBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *dowunBtn;


@property (nonatomic,weak)id<keyboardDelegate> delegate;
@end
