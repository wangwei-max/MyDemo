//
//  ViewController.m
//  状态栏指示器
//
//  Created by MAX on 16/6/14.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "WWStatusBarHUB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)success:(id)sender {
    [WWStatusBarHUB showSuccess:@"成功"];
}
- (IBAction)error:(id)sender {
    [WWStatusBarHUB showError:@"失败"];
}
- (IBAction)loading:(id)sender {
    [WWStatusBarHUB showLoading:@"加载中.."] ;
}
- (IBAction)hiden:(id)sender {
    [WWStatusBarHUB hide];
}
- (IBAction)message:(id)sender {
    [WWStatusBarHUB show:@"没有什么事情" image:[UIImage imageNamed:@"check"]];
}
@end
