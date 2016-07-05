//
//  PhotoCell.h
//  循环滚动复用
//
//  Created by MAX on 16/7/4.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,copy) NSString *imageName;
@end
