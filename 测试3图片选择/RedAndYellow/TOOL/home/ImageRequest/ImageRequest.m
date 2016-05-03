//
//  ImageRequest.m
//  RedAndYellow
//
//  Created by MAX on 16/4/21.
//  Copyright © 2016年 MAX. All rights reserved.
//
//#define URL_Search(currentPage,name,screeningId,tagId,username,password) [NSString stringWithFormat:@"%@/recipe/search.do?currentPage=%d&pageSize=20&name=%@&categoryId=&parentId=&screeningId=%@&tagId=%@&username=%@&password=%@",BaseUrl,currentPage,name,screeningId,tagId,username,password]

#import "ImageRequest.h"

@implementation ImageRequest
{
    int _currentPage;
    NSString *_name;
    NSString *_screeningId;
    NSString *_tagId;
    NSString *_username;
    NSString *_password;
    int _pageSize;
    NSString *_categoryId;
    NSString *_parentId;
    
}
-(instancetype)initWithCurrentPage:(int )currentPage Name:(NSString *)name ScreeningId:(NSString *)screeningId TagId:(NSString *)tagId Username:(NSString *)username Password:(NSString *)password
{
    if (self = [super init]) {
        _currentPage = currentPage;
        _name = name;
        _screeningId = screeningId;
        _tagId = tagId;
        _username= username;
        _password = password;
        _pageSize = 3;
        _categoryId = @"";
        _parentId = @"";
    }
    return self;
}

-(YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPost;
}

-(NSString *)requestUrl
{
//        http://api.daydaycook.com.cn/daydaycook/server/recipe/search.do?currentPage=1&pageSize=20&name=&categoryId=&parentId=&screeningId=&tagId=&username=&password=

    NSString *BaseUrl = @"http://api.daydaycook.com.cn/daydaycook/server";
    return [NSString stringWithFormat:@"%@/recipe/search.do?",BaseUrl];
    
}

-(id)requestArgument
{
    return @{
           @"currentPage": [NSNumber numberWithInt:_currentPage],
           @"name":_name,
           @"screeningId":_screeningId,
           @"tagId":_tagId,
           @"username":_username,
           @"passwor":_password,
           @"pageSize":[NSNumber numberWithInt:_pageSize],
           @"categoryId":_categoryId,
           @"parentId" :_parentId
           };
    
}

@end
