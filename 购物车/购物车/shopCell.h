//
//  shopCell.h
//  购物车
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@class Product;
@interface shopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagev;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *prcieLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteBt;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
+(id)shopCell;//xib创建cell
-(void)setProduct:(Product *)p;//cell赋值
@end
