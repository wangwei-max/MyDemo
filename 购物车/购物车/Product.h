//
//  Product.h
//  购物车
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Product : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *imageName;
@property (nonatomic,assign)CGFloat price;
@end
