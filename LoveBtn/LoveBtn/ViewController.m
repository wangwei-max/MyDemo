//
//  ViewController.m
//  LoveBtn
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "BubbleBtn.h"
@interface ViewController ()
@property (nonatomic,strong) BubbleBtn *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[BubbleBtn alloc] initWithFrame:CGRectMake(150, 500, 50, 50) maxLeft:100 maxRight:100 maxHeight:300];
    
    [self.btn setBackgroundImage:[UIImage imageNamed:@"2"] forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(Up:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

- (void)Up:(UIButton *)btn
{
   
    [self.btn BulleBtnWithRandowWithNum:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
