//
//  ViewController.m
//  05-在HTML中调用OC
//
//  Created by xiaomage on 15/9/2.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, UINavigationControllerDelegate, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载网页
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str = request.URL.absoluteString;
    NSRange range = [str rangeOfString:@"xmg://"];
    if (range.location != NSNotFound) {
        NSString *method = [str substringFromIndex:range.location + range.length];
        NSLog(@"%@", method);
//        SEL sel = NSSelectorFromString(method);
//        [self performSelector:sel];
    }
    
//    NSLog(@"%@", str);
    
    
    return YES;
}



@end
