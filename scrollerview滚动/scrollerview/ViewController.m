//
//  ViewController.m
//  scrollerview
//
//  Created by MAX on 16/4/29.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrView;
@property (nonatomic,strong)NSMutableArray *Arr;
@property (nonatomic,assign)CGFloat scrViewX;
@property (nonatomic,strong)UIImageView *imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImage *image = [[UIImage alloc] init];
//    image = [UIImage imageNamed:@"2"];
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
//    imageV.image = image;
//    [self.view addSubview:imageV];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, 700, 100, 30)];
    btn.layer.borderColor = [[UIColor blackColor] CGColor];
    btn.layer.borderWidth = 1;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5.0;
    [btn setTitle:@"asdad" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BigClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    self.scrView = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 30, 350, 650)];
    self.scrView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*7 ,320);
    self.scrView.minimumZoomScale = 0.5;
    self.scrView.maximumZoomScale = 2;
    self.scrView.delegate = self;
    self.scrView.pagingEnabled = YES;
    [self.view addSubview:self.scrView];
    

    for (int i = 1; i<=9; i++) {
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*320, 0, 320, 320)];
        self.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [self.scrView addSubview:self.imageV];
    }
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action)];
    [self.scrView addGestureRecognizer:tap];
    
}

-(void)action
{
    self.scrViewX+=320  ;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.scrView.contentOffset = CGPointMake(self.scrViewX, 0);
    [UIView commitAnimations];
}

-(void)BigClick:(UIButton *)sender
{
    NSLog(@"111111");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageV;
}
@end
