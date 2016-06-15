//
//  EditController.h
//  contact
//
//  Created by MAX on 16/5/11.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContectModel.h"
@protocol EditControllerDelegate <NSObject>
-(void)EditControllerDoneWithModel:(ContectModel *)model;
@end

@interface EditController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nametf;
@property (weak, nonatomic) IBOutlet UITextField *teltf;
@property (assign,nonatomic) id<EditControllerDelegate>delegate;
@property (strong,nonatomic) ContectModel *model;
@end
