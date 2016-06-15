//
//  EditViewController.m
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *teltf;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property BOOL isEditing;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isEditing = YES;
    if (!self.contact) {
        self.isEditing = NO;
        self.contact = [[Contact alloc] init];
    }
    self.nameTF.text = self.contact.name;
    self.teltf.text = self.contact.tel;
    self.teltf.delegate = self;
    self.nameTF.delegate = self;
}

#pragma mark -textFiled gelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)name:(id)sender {
    //    回传数据
    self.contact.name = self.nameTF.text;
    self.contact.tel = self.teltf.text;
    [self.delegate backWithContact:self.contact IsEditing:self.editing];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    

}


@end
