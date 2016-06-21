//
//  ViewController.m
//  MeunController
//
//  Created by MAX on 16/6/21.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "myLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet myLabel *Lb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    [self.Lb addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}


-(void)labelClick
{
    //1.当lebel要成为第一响应者
    [self.Lb becomeFirstResponder];
    
    //2.显示meuncontroller
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    //自定义Meuncontorller 放在controller
     UIMenuItem *ding = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(ding:)];
    UIMenuItem *replay = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(replay:)];
    UIMenuItem *report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report:)];
    menu.menuItems =@[ding,replay,report];
    [menu setTargetRect:self.Lb.bounds inView:self.Lb];
    [menu setMenuVisible:YES animated:YES];
    
}

-(void)ding: (UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}

-(void)replay: (UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}

-(void)report: (UIMenuController *)menu
{
    NSLog(@"%s",__func__);
}


@end
