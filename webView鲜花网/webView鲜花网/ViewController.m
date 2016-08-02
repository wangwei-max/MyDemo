//
//  ViewController.m
//  webView鲜花网
//
//  Created by max on 16/8/2.
//  Copyright © 2016年 max. All rights reserved.
//
//http://www.xianhua.com.cn/m/

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

//

@property(nonatomic,weak)UIActivityIndicatorView *activityIndicatorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
    
//    加载网页
    NSURL *url = [NSURL URLWithString:@"http://www.xianhua.com.cn/m/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    self.webView.scrollView.hidden = YES;
    self.webView.backgroundColor = [UIColor grayColor];
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicatorView startAnimating];
    activityIndicatorView.center = self.view.center;
    [self.webView addSubview:activityIndicatorView];
    self.activityIndicatorView = activityIndicatorView;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    改变标题
    NSString *str1 = @"var h1 = document.getElementsByTagName('h1')[0];"
                    "h1.innerHTML = 'MAXnono';";
    [webView stringByEvaluatingJavaScriptFromString:str1];
    
//    删除尾部
    NSString *str2 = @"var footer = document.getElementById('footer');"
    "footer.remove();";
    [webView stringByEvaluatingJavaScriptFromString:str2];
    
//    拿出所有网页内容
    NSString *str3 = @"document.body.outerHTML";
    NSString *html = [webView stringByEvaluatingJavaScriptFromString:str3];
    NSLog(@"%@",html);
    
//   让scrollview显示
    self.webView.scrollView.hidden = NO;
    self.activityIndicatorView.hidden = YES;
}

















@end




