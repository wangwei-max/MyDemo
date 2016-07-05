//
//  PhotoCell.m
//  循环滚动复用
//
//  Created by MAX on 16/7/4.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)awakeFromNib {
    //边框
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
    // Initialization code
}
-(void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
