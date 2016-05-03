//
//  ImageRequest.h
//  RedAndYellow
//
//  Created by MAX on 16/4/21.
//  Copyright © 2016年 MAX. All rights reserved.
//


#import "YTKRequest.h"

@interface ImageRequest : YTKRequest

-(instancetype)initWithCurrentPage:(int )currentPage Name:(NSString *)name ScreeningId:(NSString *)screeningId TagId:(NSString *)tagId Username:(NSString *)username Password:(NSString *)password;
@end
