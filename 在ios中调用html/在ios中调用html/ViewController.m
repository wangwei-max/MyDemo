//
//  ViewController.m
//  在ios中调用html
//
//  Created by max on 16/8/2.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    加载网页
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"index" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    
}
#pragma mark - 操作网页
-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    删除
    NSString *str1 = @"var word = document.getElementById('word');";
    NSString *str2 = @"word.remove();";
    [webView stringByEvaluatingJavaScriptFromString:str1];
    [webView stringByEvaluatingJavaScriptFromString:str2];
    
//    更改
    NSString *str3 = @"var change = document.getElementsByClassName('change')[0];";
    NSString *str4 = @"change.innerHTML = '改变的第一个';";
    [webView stringByEvaluatingJavaScriptFromString:str3];
    [webView stringByEvaluatingJavaScriptFromString:str4];
    
//    插入
    NSString *str5 = @"var img = document.createElement('img');"
                    "img.src = 'img_01.jpg';"
                    "img.width = '100';"
                    "document.body.appendChild(img);";
    [webView stringByEvaluatingJavaScriptFromString:str5];
}

@end
