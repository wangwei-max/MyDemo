//
//  EditController.m
//  contact
//
//  Created by MAX on 16/5/11.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "EditController.h"
#import "MainController.h"
@interface EditController ()
@property (nonatomic,strong)UIBarButtonItem *liftBtn;
@property (nonatomic,strong)UIBarButtonItem *rigthBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation EditController

-(ContectModel *)model
{
    if (!_model) {
        _model = [[ContectModel alloc] init];
    }
    return _model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    self.nametf.text =  self.model.name;
    self.teltf.text = self.model.tel;
  
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)okBtn:(id)sender {
    ContectModel *model = [[ContectModel alloc] init];
    
    model.name = self.nametf.text;
    model.tel = self.teltf.text;
    [self.delegate EditControllerDoneWithModel:model];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
