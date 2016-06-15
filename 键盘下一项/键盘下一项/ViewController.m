//
//  ViewController.m
//  键盘下一项
//
//  Created by MAX on 16/5/24.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "keyboard.h"
@interface ViewController ()<UITextFieldDelegate,keyboardDelegate>

@property(nonatomic,strong) NSArray *arrTF;

@property (nonatomic,strong) keyboard *toolBar;
@end

@implementation ViewController

-(NSArray *)arrTF
{
    if (!_arrTF) {
        _arrTF = [NSMutableArray array];
    }
    return _arrTF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrTF = @[self.nametf,self.emailtf,self.address];
    
    //加载工具条
    keyboard *toolbar = [keyboard tool];
    toolbar.delegate = self;
    
    self.toolBar = toolbar;
    
    //设置工具条
    self.nametf.inputAccessoryView = toolbar ;
    self.emailtf.inputAccessoryView = toolbar;
    self.address.inputAccessoryView = toolbar;
}

////更换键盘
//UIView *kview = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//kview.backgroundColor = [UIColor blueColor];
//self.emailtf.inputView = kview;

//键盘顶部工具条
//    UIView *toolbar = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 44)];
//    toolbar.backgroundColor = [UIColor redColor];
//    self.nametf.inputAccessoryView = toolbar;
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <keyboardDelegate>
-(void)keyboardDidClickupItem:(keyboard *)tool
{
    NSInteger currentIndex = 0;
    for (UIView *view in self.view.subviews) {
        if ([view isFirstResponder]) {
            currentIndex = [self.arrTF indexOfObject:view];
        }
    }
    currentIndex--;
    
    [self.arrTF[currentIndex] becomeFirstResponder];
    
    self.toolBar.upBtn.enabled = (currentIndex != 0);
    self.toolBar.dowunBtn.enabled = YES;
}

-(void)keyboardDidClickdoneItem:(keyboard *)tool
{
    NSInteger currentIndex = 0;
    for (UIView *view in self.view.subviews) {
        if ([view isFirstResponder]) {
            currentIndex = [self.arrTF indexOfObject:view];
        }
    }
    currentIndex++;
    
    [self.arrTF[currentIndex] becomeFirstResponder];
    self.toolBar.upBtn.enabled = (currentIndex != 0);
    self.toolBar.upBtn.enabled = YES;
}

-(void)keyboardDidClickdownItem:(keyboard *)tool
{
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nametf) {
        [self.emailtf becomeFirstResponder];
        
    }
    else if (textField == self.emailtf)
    {
        [self.address becomeFirstResponder];
        
    }
    else
    {
        [self.view endEditing:YES];
        
    }
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES]; 
}
@end
