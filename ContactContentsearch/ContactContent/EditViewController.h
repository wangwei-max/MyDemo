//
//  EditViewController.h
//  ContactContent
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@protocol EditViewDelegate <NSObject>
-(void)DoneWithModel:(DataModel *)model;
@end
@interface EditViewController : UIViewController
@property(nonatomic,assign)id<EditViewDelegate> delegate;
@property (strong, nonatomic) DataModel *Model;
@end
