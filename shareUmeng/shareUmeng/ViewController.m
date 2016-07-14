//
//  ViewController.m
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

#import "ViewController.h"
#import "UMSocial.h"
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
- (IBAction)button:(id)sender {
    [UMSocialData defaultData].extConfig.title = @"title的分享";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://www.baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5786e668e0f55a609a0012b8"
                                      shareText:@"秋天快点来"
                                     shareImage:[UIImage imageNamed:@"2"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToQzone,UMShareToWechatTimeline]
                                       delegate:nil];
}

- (IBAction)twobutton:(id)sender {
}
- (IBAction)threebutton:(id)sender {
}
- (IBAction)forthbutton:(id)sender {
}
- (IBAction)fivthbutton:(id)sender {
}

@end
