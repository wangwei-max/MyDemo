//
//  DetailViewController.m
//  ContactContent
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"
#import "MainViewController.h"
@interface DetailViewController ()
@property (strong,nonatomic)UIBarButtonItem *leftbutton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(DataModel *)Model
{
    if (!_Model) {
        _Model = [[DataModel alloc] init];
    }
    return _Model;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.title = @"详情";
    
    self.leftbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = self.leftbutton;
    
    self.nameLabel.text = self.Model.contectName;
    self.telLabel.text = self.Model.contectPhone;
    
}
- (IBAction)editBtn:(id)sender {
    NSLog(@"编辑");
    EditViewController *editVC = [[EditViewController alloc] init];
    editVC.Model = self.Model;
    editVC.delegate = self;
    [self presentViewController:editVC animated:YES completion:nil];
}

-(void)back:(UIButton *)send
{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)DoneWithModel:(DataModel *)model{
    self.Model=model;
}
-(void)dealloc{
    NSLog(@"............");
}
@end
