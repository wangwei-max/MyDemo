//
//  ShowViewController.m
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ShowViewController.h"
#import "EditViewController.h"
@interface ShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.nameLabel.text = self.contact.name;
    self.telLabel.text = self.contact.tel;
}
- (IBAction)editContact:(id)sender {
    [self performSegueWithIdentifier:@"editContact" sender:self];
}

- (IBAction)done:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
  
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editContact"]) {
        EditViewController *editVC = segue.destinationViewController;
        editVC.delegate = self.navigationController.viewControllers[0];
        editVC.contact  = self.contact;
    }

}


@end
