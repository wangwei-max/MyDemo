//
//  shwoController.m
//  contact
//
//  Created by MAX on 16/5/11.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "shwoController.h"
#import "EditController.h"
@interface shwoController ()
@property (strong,nonatomic)UIBarButtonItem *liftBtn;

@end

@implementation shwoController
-(ContectModel *)model
{
    if (!_model) {
        _model =[[ContectModel alloc] init];
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"查看页";
    self.liftBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(liftBtnAction:)];
    self.navigationItem.leftBarButtonItem = self.liftBtn;
    
    self.nameLabel.text = self.model.name;
    self.telLabel.text = self.model.tel;
}

-(void)liftBtnAction:(UIButton *)sender
{

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editBtn:(id)sender {
    EditController *edit = [[EditController alloc] init];
    
    edit.model =  self.model;
    [self presentViewController:edit animated:YES completion:nil];
}




@end
