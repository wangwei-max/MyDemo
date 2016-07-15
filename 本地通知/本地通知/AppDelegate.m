//
//  AppDelegate.m
//  本地通知
//
//  Created by MAX on 16/7/14.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //图标右上角为0
    [application setApplicationIconBadgeNumber:0];
    
//    判断版本号
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge | UIUserNotificationTypeSound  categories:nil];
//        注册
        [application registerUserNotificationSettings:setting];
    }
    
    
    return YES;
}

/*
    应用程序进入前台时候或者已经在前台的时候调用
 */
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"%s",__func__);
    //如果进入前台的时候
    if (application.applicationState == UIApplicationStateInactive) {
        NSLog(@"%@",notification.userInfo);
    }
}
@end
