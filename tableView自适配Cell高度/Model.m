//
//  Model.m
//  tv
//
//  Created by MAX on 16/4/22.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "Model.h"

@implementation Model
-(void)withDic:(NSDictionary *)dic
{
//   mydescription;
//   name;
//   eleaseDate;
//   NSArray *imageUrl;
    self.mydescription = [dic objectForKey:@"description"];
    self.name = [dic objectForKey:@"name"];
    self.releaseDate = [dic objectForKey:@"releaseDate"];
    self.imageUrl = [dic objectForKey:@"imageUrl"];
}
@end
