//
//  EditViewController.h
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@protocol EditViewControllerDelegate;
@interface EditViewController : UIViewController<UITextFieldDelegate>
@property (strong,nonatomic)Contact *contact;
@property (weak,nonatomic)id<EditViewControllerDelegate> delegate;
@end

@protocol EditViewControllerDelegate
-(void)backWithContact:(Contact *)contact IsEditing:(BOOL)isEditing;
@end