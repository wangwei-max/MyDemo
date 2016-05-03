//
//  SmallTableViewCell.h
//  RedAndYellow
//
//  Created by MAX on 16/4/20.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headPic;
@property (nonatomic,weak) NSString *nametitle;
@end
