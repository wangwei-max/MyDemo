//
//  shopCell.m
//  购物车
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "shopCell.h"

@implementation shopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(id)shopCell
{
    shopCell *cell = nil;
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"shopCell" owner:self options:nil];
    cell = [views lastObject];
    
    return cell;
}

-(void)setProduct:(Product *)p
{
    [self.imagev setImage:[UIImage imageNamed:p.imageName]];
    self.imagev.contentMode = UIViewContentModeScaleAspectFit;
    self.namelabel.text = p.imageName;
    self.prcieLabel.text = [NSString stringWithFormat:@"¥%.2f",p.price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
