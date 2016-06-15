//
//  ViewController.h
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowViewController.h"
#import "EditViewController.h"
@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIVideoEditorControllerDelegate>
@property (strong,nonatomic)NSMutableArray *contactsData;

@end

