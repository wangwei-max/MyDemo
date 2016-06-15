//
//  WWStatusBarHUB.h
//  状态栏指示器
//
//  Created by MAX on 16/6/14.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWStatusBarHUB : NSObject

/**
 * 显示普通信息
 *  @param msg   文字
 *  @param image 图片
*/
+(void)show:(NSString *)msg image:(UIImage *)image;

/**
 * 显示普通信息
 */
+(void)showMessage:(NSString *)msg;

/**
 * 显示成功信息
 */
+(void)showSuccess:(NSString *)msg;

/**
 * 显示失败信息
 */
+(void)showError:(NSString *)msg;

/**
 * 显示正在处理信息
 */
+(void)showLoading:(NSString *)msg;

/**
 * 隐藏
 */
+(void)hide;
@end
