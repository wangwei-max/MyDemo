//
//  Cell.m
//  tv
//
//  Created by MAX on 16/4/22.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "Cell.h"
#import "UIView+Extension.h"
@implementation Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)resizingSubViewsWithName:(NSString *)name Datei:(NSString *)datei Time:(NSString *)time
{
    [self.nameLabel removeFromSuperview];
    [self.dateiLabel removeFromSuperview];
    [self.topimage removeFromSuperview];
    [self.timeLabel removeFromSuperview];
    
    CGFloat magin = 16;
    self.topimage = [[UIImageView alloc] initWithFrame:CGRectMake(16, 16, [UIScreen mainScreen].bounds.size.width-32, [UIScreen mainScreen].bounds.size.width-32)];
    [self addSubview:self.topimage];
    
    CGRect rect = [name boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:21 weight:2]} context:nil];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, self.topimage.frame.origin.y + self.topimage.bounds.size.height+16, [UIScreen mainScreen].bounds.size.width-32, rect.size.height)];
    self.nameLabel.text = name;
    self.nameLabel.font=[UIFont systemFontOfSize:21 weight:2];
     self.nameLabel.numberOfLines=0;
    [self addSubview:self.nameLabel];
    
    CGRect dateiRect = [datei boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:16 weight:2]} context:nil];
    self.dateiLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, self.nameLabel.frame.origin.y +self.nameLabel.bounds.size.height+magin, [UIScreen mainScreen].bounds.size.width-32, dateiRect.size.height) ];
     self.dateiLabel.font=[UIFont systemFontOfSize:16 weight:2];
     self.dateiLabel.text = datei;
     self.dateiLabel.numberOfLines=0;
    [self addSubview: self.dateiLabel];
    
    CGRect timeRcet = [time boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16 weight:2]} context:nil];
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, self.dateiLabel.frame.origin.y +self.dateiLabel.bounds.size.height +magin, self.dateiLabel.bounds.size.width, timeRcet.size.height) ];
     self.timeLabel.numberOfLines=0;
     self.timeLabel.text = time;
     self.timeLabel.font=[UIFont systemFontOfSize:16 weight:2];
    [self addSubview:self.timeLabel];
    
//    self.height = self.timeLabel.frame.origin.y + self.timeLabel.size.width +magin;
    self.height = self.timeLabel.y + self.timeLabel.height+20;
    
}
@end
