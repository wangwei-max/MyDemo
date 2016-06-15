//
//  OneController.m
//  view中view跳转传值
//
//  Created by MAX on 16/6/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "OneController.h"
#import "BigView.h"
#import "SmallView.h"

#define BigH 150
#define magrin 10
@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"控制器1";
    self.view.backgroundColor = [UIColor grayColor];
    [self createBigView];
}

-(void)createBigView
{
    for (int i = 0; i<6; i++) {
        BOOL isLeft = i%2 ? NO : YES;
        CGFloat X = isLeft ? magrin : magrin*2 +([UIScreen mainScreen].bounds.size.width-magrin*3)/2;
        CGFloat Y = 64+magrin + i/2*(BigH+magrin);
        BigView *bv = [[BigView alloc] initWithLabelText:[NSString stringWithFormat:@"D%d",i+1] X:X Y:Y];
        
        [self.view addSubview:bv];
    }
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
