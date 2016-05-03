//
//  ImageModel.h
//  RedAndYellow
//
//  Created by MAX on 16/4/21.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property(nonatomic,copy)NSString *imageUrl;
@property(nonatomic,copy)NSString *name;
-(void)parseWithDic:(NSDictionary *)dic;
@end
