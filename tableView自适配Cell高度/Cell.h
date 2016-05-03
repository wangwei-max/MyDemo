//
//  Cell.h
//  tv
//
//  Created by MAX on 16/4/22.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell
@property(nonatomic,strong) UIImageView *topimage;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *dateiLabel;
@property(nonatomic,strong) UILabel *timeLabel;
-(void)resizingSubViewsWithName:(NSString *)name Datei:(NSString *)datei Time:(NSString *)time;
@end
