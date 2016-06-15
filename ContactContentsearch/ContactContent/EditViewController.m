//
//  EditViewController.m
//  ContactContent
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *TelTextF;

@end

@implementation EditViewController

-(DataModel *)Model
{
    if (!_Model) {
        _Model = [[DataModel alloc] init];
    }
    return _Model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextF.text = self.Model.contectName;
    self.TelTextF.text = self.Model.contectPhone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)doneAction:(id)sender {
    DataModel *model=[[DataModel alloc]init];
    model.contectName=self.nameTextF.text;
    model.contectPhone=self.TelTextF.text;
    [self.delegate DoneWithModel:model];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
