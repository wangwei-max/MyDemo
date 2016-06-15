//
//  ShowViewController.h
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "EditViewController.h"
@interface ShowViewController : UIViewController<EditViewControllerDelegate>
@property (strong,nonatomic) Contact *contact;
@end
