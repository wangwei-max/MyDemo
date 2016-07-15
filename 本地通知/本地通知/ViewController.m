//
//  ViewController.m
//  本地通知
//
//  Created by MAX on 16/7/14.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)localNote:(id)sender {
    //1.创建本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    
    //2.设置本地通知的内容
    //2.1设置通知发出的时间
    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
    //2.2 设置通知的内容
    localNote.alertBody = @"今天你开心吗";
    
    //设置滑块文字
    localNote.alertAction = @"去你妈的逼";
    
    //设置桌面右上角红点数值
    localNote.applicationIconBadgeNumber = 10;
    
    //跳转不同界面时候使用
    localNote.userInfo =@{@"tpye" : @1
                          
                          };
    
    //3.调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote
     ];
    
}

/*
// timer-based scheduling
@property(nullable, nonatomic,copy) NSDate *fireDate;
// the time zone to interpret fireDate in. pass nil if fireDate is an absolute GMT time (e.g. for an egg timer).
// pass a time zone to interpret fireDate as a wall time to be adjusted automatically upon time zone changes (e.g. for an alarm clock).
@property(nullable, nonatomic,copy) NSTimeZone *timeZone;

@property(nonatomic) NSCalendarUnit repeatInterval;      // 0 means don't repeat
@property(nullable, nonatomic,copy) NSCalendar *repeatCalendar;

// location-based scheduling

// set a CLRegion object to trigger the notification when the user enters or leaves a geographic region, depending upon the properties set on the CLRegion object itself. registering multiple UILocalNotifications with different regions containing the same identifier will result in undefined behavior. the number of region-triggered UILocalNotifications that may be registered at any one time is internally limited. in order to use region-triggered notifications, applications must have "when-in-use" authorization through CoreLocation. see the CoreLocation documentation for more information.
@property(nullable, nonatomic,copy) CLRegion *region NS_AVAILABLE_IOS(8_0);

// when YES, the notification will only fire one time. when NO, the notification will fire every time the region is entered or exited (depending upon the CLRegion object's configuration). default is YES.
@property(nonatomic,assign) BOOL regionTriggersOnce NS_AVAILABLE_IOS(8_0);

// alerts
@property(nullable, nonatomic,copy) NSString *alertBody;      // defaults to nil. pass a string or localized string key to show an alert
@property(nonatomic) BOOL hasAction;                // defaults to YES. pass NO to hide launching button/slider
@property(nullable, nonatomic,copy) NSString *alertAction;    // used in UIAlert button or 'slide to unlock...' slider in place of unlock
@property(nullable, nonatomic,copy) NSString *alertLaunchImage;   // used as the launch image (UILaunchImageFile) when launch button is tapped
@property(nullable, nonatomic,copy) NSString *alertTitle NS_AVAILABLE_IOS(8_2);  // defaults to nil. pass a string or localized string key

// sound
@property(nullable, nonatomic,copy) NSString *soundName;      // name of resource in app's bundle to play or UILocalNotificationDefaultSoundName

// badge
@property(nonatomic) NSInteger applicationIconBadgeNumber;  // 0 means no change. defaults to 0

// user info
@property(nullable, nonatomic,copy) NSDictionary *userInfo;   // throws if contains non-property list types

// category identifer of the local notification, as set on a UIUserNotificationCategory and passed to +[UIUserNotificationSettings settingsForTypes:categories:]
 */
@end
