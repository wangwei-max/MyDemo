//
//  shwoController.h
//  contact
//
//  Created by MAX on 16/5/11.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContectModel.h"
@interface shwoController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (strong,nonatomic) ContectModel *model;
@end
