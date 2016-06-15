//
//  DetailViewController.h
//  ContactContent
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "DataModel.h"
@interface DetailViewController : UIViewController<EditViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) DataModel *Model;
@end
