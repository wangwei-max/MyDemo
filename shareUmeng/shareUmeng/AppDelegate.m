//
//  AppDelegate.m
//  shareUmeng
//
//  Created by MAX on 16/7/14.
//  Copyright © 2016年 MAX. All rights reserved.
//
//友盟社会化组件注册KEY
#define shareKey @"5681ebaae0f55a80e20025cd"
//移动端QQ以及QQ空间初始化KEY
#define QQAppId @"1105266681"
#define QQShareKey @"QDkd2EiiDHx6jCxU"
//微信初始化KEY
#define weChatKey    (@"wxd72d1a54881a4517")
#define weChatSecrt  (@"05ce2b2766ead2de7fdff1045eddb6b")
//极光推送初始化KEY

#import "AppDelegate.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UMSocialData setAppKey:@"5786e668e0f55a609a0012b8"];

    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxd72d1a54881a4517" appSecret:@"05ce2b2766ead2de7fdff1045eddb6b" url:@"http://www.baidu.com"];
    
    return YES;
}


//5786e668e0f55a609a0012b8
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
