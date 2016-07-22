//
//  ViewController.m
//  键盘操作
//
//  Created by max on 16/7/22.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

#define screenSzie [UIScreen mainScreen].bounds.size
@interface ViewController ()<UITextFieldDelegate>
{
    UITextField *_tf1;
    UIView *_redview;
    UIView *_bgview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self subViews];
    [self notie];
   
}

-(void)subViews
{
    _bgview = [[UIView alloc]initWithFrame:self.view.bounds];
    _bgview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_bgview];
    
    _redview = [[UIView alloc]initWithFrame:CGRectMake(50, 30, 200, 200)];
    _redview.backgroundColor = [UIColor redColor];
    [_bgview addSubview:_redview];
    
    _tf1 = [[UITextField alloc] initWithFrame:CGRectMake(10, screenSzie.height-32, screenSzie.width-20, 30)];
    _tf1.backgroundColor = [UIColor yellowColor];
    _tf1.placeholder =@"dsfsfsfsfdsfdsfsdf";
    _tf1.returnKeyType = UIReturnKeyGo;
    _tf1.delegate = self;
    [_bgview addSubview:_tf1];
    
}

-(void)notie
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification *)note
{
    //取得键盘弹出时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    NSLog(@"one====%0.2f",duration);
    //取得键盘高度
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    //option的值设置为7 << 16会让view跟键盘弹出效果同步
//    [UIView animateWithDuration:duration delay:0 options:7 << 16 animations:^{
//          NSLog(@"two====%0.2f",duration);
//        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
//        [self.view layoutSubviews];
//    } completion:nil];
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
        [self.view layoutSubviews];
        
    }];

}

-(void)keyboardWillHide:(NSNotification *)note
{
    //取出弹出的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]floatValue];
 
    
    [UIView animateWithDuration:duration delay:0 options:7<<16 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    } completion:nil];
}

//推出键盘1
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//推出键盘2
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
  
    [textField endEditing:YES];
    return  YES;
}
@end
