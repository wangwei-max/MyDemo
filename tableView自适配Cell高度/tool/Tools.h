//
//  Tools.h
//  iCarCenter
//
//  Created by Peter on 15/2/4.
//  Copyright (c) 2015年 机锋科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "Reachability.h"
#import "Toast+UIView.h"
#import "SDImageCache.h"
#import "LoadingView.h"

@interface Tools : NSObject
 
//获取Documents文件夹下文件路径
+(NSString *)getFilePathInDocuments:(NSString *)fileName;
+(NSString *)getDocumentsPath;
//获取Library/Caches路径
+(NSString *)getLibraryCachesPath:(NSString*)fileName fileGroup:(NSString*)fileGroup;
// 获取应用在本机设置中是否关闭通知
+(BOOL)isAllowedNotification;
+(UIView *)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;
// 毫秒转化成日期格式
+(NSString *)getConversionTime:(NSString *)timeStr;
//从一段字符串中截取指定字数的字符串
+ (NSString *)getSubString:(NSString *)strSource WithCharCounts:(NSInteger)number;
//将数组转变成以指定字符隔开的字符串
+(NSString *) getStringFromArray:(NSArray *)srcArray byCharacter:(NSString *)character;
//传入时间查看时候间隔 如1天前，  58分钟前
+(NSString*)timestamp:(NSString*)dateTimeStr lastDateTimeStr:(NSString *)lastDateTime;
//检测两个时间段相差多少天
//从时间串中 根据时间差 在同一天的时候显示 小时分钟，超过一天就显示时间
+(NSString*)getTimeFromTimeStr:(NSString*)timeStr;
+(NSString*)getDaysFromDates:(NSString*)dateTimeStr lastDateTimeStr:(NSString *)lastDateTime;
// 是否wifi
+ (BOOL) IsEnableWIFI;
// 是否3G
+ (BOOL) IsEnable3G;
//获取当前系统时区的时间
+(NSString*)getCurrentDateWithSystemLocalZone;

//隐藏分割线
+ (void)setExtraCellLineHidden: (UITableView *)tableView;
//判断网络是否存在
+(BOOL)isExistenceNetwork;
//提示框
+(void)showAlertWithString:(NSString*)message;
//拨打电话
+(void)contactPhone:(NSString *)phone view:(UIView*)view;
//获取设备xib
+ (id)loadNibName:(NSString *)name;

//获取UIStoryboard
+ (id)loadStoryboardName:(NSString *)name ViewName:(NSString*)viewname;

//判断是否是同一天
+(BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;
//字符串中是否含有emoji表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
//计算中文混合字符个数
+(int)convertToInt:(NSString*)strtemp;
//图片压缩
+(NSData *) scaleImage:(UIImage *) image;

+ (UIWindow *)keyWindow;
//获取值得 尺寸的 图片的URL
+(NSString*)getImageUrl:(NSString *)url witdh:(int)withd withtHeight:(int)height;

//服务端返回的图片大小
+(CGSize)downloadImageSizeWithURL:(id)imageURL;
//GET 请求
+ (void)GET:(NSString *)url params:(NSDictionary *)params superviewOfMBHUD:(UIView *)view success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

//Post 请求
+ (void)POST:(NSString *)url params:(NSDictionary *)params superviewOfMBHUD:(UIView *)view success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

//获取当前设备号
+(NSString*)getUuid;

//判断是否为电话号码
+ (BOOL)isMobileNumber:(NSString *)telephoneNum;

//判断是否为邮箱
+ (BOOL)isEmail:(NSString *)email;
@end
