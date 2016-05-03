//
//  Model.h
//  tv
//
//  Created by MAX on 16/4/22.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic,copy) NSString *mydescription;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *releaseDate;
@property (nonatomic,copy) NSArray *imageUrl;

-(void)withDic:(NSDictionary *)dic;
@end
