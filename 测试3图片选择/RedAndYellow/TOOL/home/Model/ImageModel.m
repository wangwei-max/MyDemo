//
//  ImageModel.m
//  RedAndYellow
//
//  Created by MAX on 16/4/21.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
-(void)parseWithDic:(NSDictionary *)dic
{
    self.imageUrl = [dic objectForKey:@"imageUrl"];
    self.name = [dic objectForKey:@"title"];
}
@end
