//
//  Tools.m
//  iCarCenter
//
//  Created by Storm on 14-4-28.
//  Copyright (c) 2014年 Storm. All rights reserved.
//

#import "Tools.h"

@implementation Tools


 
//获取Documents路径
+(NSString *)getDocumentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

//获取Documents文件夹下文件路径
+(NSString *)getFilePathInDocuments:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", fileName]];
}
//获取Library/Caches路径
+(NSString *)getLibraryCachesPath:(NSString*)fileName fileGroup:(NSString*)fileGroup
{
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths lastObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileGroup=[filePath stringByAppendingPathComponent:fileGroup];
    if(![fileManager fileExistsAtPath:fileGroup])
    {
         [fileManager createDirectoryAtPath:fileGroup withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    filePath=[fileGroup stringByAppendingPathComponent:fileName];
    return  filePath;
}

//
+(BOOL)isFileExist:(NSString *)fileName
{
    NSString *filePath = [self getFilePathInDocuments:fileName];
    return ([[NSFileManager defaultManager] fileExistsAtPath:filePath] ? YES : NO);
}

// 获取应用在本机设置中是否关闭通知
+(BOOL)isAllowedNotification {
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] < 8.0) {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone != type)
            return YES;
    }else{
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone != setting.types) {
            return YES;
        }
    }
    return NO;
}

+(UIView *)showHUDAddedTo:(UIView *)view animated:(BOOL)animated{
    
    
    if (animated == NO) {
        if (view != nil) {
            [[view viewWithTag:1000] removeFromSuperview];
            view.userInteractionEnabled = YES;
        }
    }
    else{
        LoadingView *loading = [[LoadingView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH - 82) /2, (DEVICE_HEIGHT - 87) /2 - 80, 82, 107)];
        loading.tag = 1000;
        view.userInteractionEnabled = NO;
        [view addSubview:loading];
    }
    return view;
}

// 毫秒转化成日期格式
+(NSString *)getConversionTime:(NSString *)timeStr{
 
    NSTimeInterval timeInterval = [timeStr doubleValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     return  [formatter stringFromDate:date];
 
}

// 从字符串中获取字数个数为N的字符串，单字节字符占半个字数，双字节占一个字数
+ (NSString *)getSubString:(NSString *)strSource WithCharCounts:(NSInteger)number
{
    // 一个字符以内，不处理
	if (strSource == nil || [strSource length] <= 1) {
		return strSource;
	}
	char *pchSource = (char *)[strSource cStringUsingEncoding:NSUTF8StringEncoding];
	NSInteger sourcelen = strlen(pchSource);
	int nCharIndex = 0;		// 字符串中字符个数,取值范围[0, [strSource length]]
	int nCurNum = 0;		// 当前已经统计的字数
	for (int n = 0; n < sourcelen; ) {
		if( *pchSource & 0x80 ) {
			if ((nCurNum + 2) > number * 2) {
				break;
			}
			pchSource += 3;		// NSUTF8StringEncoding编码汉字占３字节
			n += 3;
			nCurNum += 2;
		}
		else {
			if ((nCurNum + 1) > number * 2) {
				break;
			}
			pchSource++;
			n += 1;
			nCurNum += 1;
		}
		nCharIndex++;
	}
	assert(nCharIndex > 0);
	return [strSource substringToIndex:nCharIndex];
}

+(NSString *) getStringFromArray:(NSArray *)srcArray byCharacter:(NSString *)character
{
	NSMutableString *mutabString = [[NSMutableString alloc] init];
	int i = 0;
	if (srcArray.count > 0)
	{
		for (i = 0; i < srcArray.count-1; i++)
		{
			[mutabString appendFormat:@"%@%@",[srcArray objectAtIndex:i],character];
		}
		[mutabString appendString:[srcArray objectAtIndex:i]];
	}
	return mutabString;
}

// 比较两个时间差
+(NSString*)timestamp:(NSString*)dateTimeStr lastDateTimeStr:(NSString *)lastDateTime
{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *cal=[NSCalendar currentCalendar];
    unsigned int unitFlags=NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:[date dateFromString:dateTimeStr] toDate:[date dateFromString:lastDateTime] options:0];
    DLog(@"*****************----------------%ld 年%ld 月%ld天%ld小时%ld分钟%ld秒",(long)[d year],(long)[d month],(long)[d day],(long)[d hour],(long)[d minute],(long)[d second]);
    
    
    
    
    
    
//    //将传入时间转化成需要的格式
//    NSDateFormatter *format=[[NSDateFormatter alloc] init];
//    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *fromdate = [format dateFromString:dateTimeStr];
//    NSDate *lfromdate = [format dateFromString:lastDateTime];
//    
//    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
//    
//    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
//    NSInteger lfrominterval = [fromzone secondsFromGMTForDate:lfromdate];
//    
//    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
//    NSDate *localeDate = [lfromdate  dateByAddingTimeInterval: lfrominterval];
//    
//    double intervalTime = [localeDate timeIntervalSinceReferenceDate] - [fromDate timeIntervalSinceReferenceDate];
//    
//    long lTime = (long)intervalTime;
//    NSInteger iSeconds = lTime % 60;
//    NSInteger iMinutes = (lTime / 60) % 60;
//    NSInteger iHours = (lTime / 3600);
//    NSInteger iDays = lTime/86400;///60/60/24
//    NSInteger iMonth = lTime/1036800;//60/60/24/12
//    NSInteger iYears = lTime/60/60/24/384;
//    
//     DLog(@"相差%ld年%ld月 %ld日%ld时%ld分%ld秒", (long)iYears,(long)iMonth,(long)iDays,(long)iHours,(long)iMinutes,(long)iSeconds);
    
//    if(){
//        
//        return [NSString stringWithFormat:@"%ld年前",(long)[d year]];
//        
//    }else if(){
//        return [NSString stringWithFormat:@"%ld个月前",(long)[d month]];
//    }else if([d day]>=7){
//        if ([d day] ==7) {
//            return @"1周前";
//        }
//        return [NSString  stringWithFormat:@"%ld周前",(long)[d day]/7];
//    }else
    if([d year]>0 || [d month]>0 || [d day]>=7 || [d day]>0){
        return dateTimeStr;
    }else
    if([d hour]>0){
//        if ([d hour] <= 24) {
            return [NSString  stringWithFormat:@"%ld小时前",(long)[d hour]];
//        }
//        else{
        
//        }
    }else if([d minute]>0){
        return [NSString  stringWithFormat:@"%ld分钟前",(long)[d minute]];
    }else if([d second] > 0){
        return [NSString  stringWithFormat:@"%ld秒前",(long)[d second]];
    }else {
        return @"刚刚";
    }
    
    return nil;
}
+(NSString*)getDaysFromDates:(NSString*)dateTimeStr lastDateTimeStr:(NSString *)lastDateTime{
    //将传入时间转化成需要的格式
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromdate = [format dateFromString:dateTimeStr];
    NSDate *lfromdate = [format dateFromString:lastDateTime];
    
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSInteger lfrominterval = [fromzone secondsFromGMTForDate:lfromdate];
    
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    NSDate *localeDate = [lfromdate  dateByAddingTimeInterval: lfrominterval];
    
    double intervalTime = [localeDate timeIntervalSinceReferenceDate] - [fromDate timeIntervalSinceReferenceDate];
    
    long lTime = (long)intervalTime;
    NSInteger iDays = lTime/60/60/24;
    
    // DLog(@"相差%d年%d月 %d日%d时%d分%d秒", iYears,iMonth,iDays,iHours,iMinutes,iSeconds);
    if(iDays>0){
        return [NSString  stringWithFormat:@"%ld",(long)(long)iDays];
    }
    return nil;

}
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

//计算 中英文混合 字符数；
+(int)convertToInt:(NSString*)strtemp {
	
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
	
}

// 是否wifi
+ (BOOL) IsEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
+ (BOOL) IsEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}
//图片压缩
+(NSData *) scaleImage:(UIImage *) image
{
	NSData *dataImage = UIImageJPEGRepresentation(image, 1.0);
	DLog(@"imagesize:%ld",(long)dataImage.length/1024);
    NSUInteger sizeOrigin = [dataImage length];
    NSUInteger sizesizeOriginKB = sizeOrigin / 1024;
	
	
	float q = 1.0;
	if (sizesizeOriginKB > 1024*10) //10M
	{
		q = 0.5;
	}else if(sizesizeOriginKB > 1024*7) //7M
	{
		q = 0.7;
	}
	else if(sizesizeOriginKB > 1024*5) //5M
	{
		q = 0.8;
	}else if(sizesizeOriginKB > 1024*4){
        q = 0.9;
    }
	else if(sizesizeOriginKB > 1024*3)//3M
	{
		q = 0.92;
	}
    //	else if(sizesizeOriginKB > 1024) //1M
    //	{
    //		q = 0.9;
    //	}
    
    // 图片压缩
    if (q !=1.0)
	{
		DLog(@"q:%f",q);
        CGSize sizeImage = [image size];
        DLog(@"before !!!!,%@,%f,%f",image,sizeImage.width,sizeImage.height);
        CGFloat iwidthSmall = sizeImage.width * q;
		CGFloat iheightSmall = sizeImage.height * q;
		
		//为了保证在主页的显示，宽度不低于320
		if (iwidthSmall < 320)
		{
			iheightSmall = iheightSmall * (320/iwidthSmall);
			iwidthSmall = 320;
			
		}
        CGSize itemSizeSmall = CGSizeMake(iwidthSmall, iheightSmall);
        UIGraphicsBeginImageContext(itemSizeSmall);
        
        CGRect imageRectSmall = CGRectMake(0.0f, 0.0f, itemSizeSmall.width+2, itemSizeSmall.height+2);  //长和宽都增加2个像素，防止有些图片绘制旁边出现白线
		DLog(@"before drawInRect!!,%f,%f",imageRectSmall.size.width,imageRectSmall.size.height);
        [image drawInRect:imageRectSmall];
		//DLog(@"after drawInRect!!!!");
        UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
		dataImage = UIImageJPEGRepresentation(scaleImage,0.38);
        
        //UIImagePNGRepresentation(scaleImage);// UIImageJPEGRepresentation(scaleImage,0.9);
		
    }else{
        dataImage = UIImageJPEGRepresentation(image,0.38);
    }
	DLog(@"压缩bit 后：%ld",(long)[dataImage length]/1024);
	return dataImage;
	
}
//服务端返回的图片大小
+(CGSize)downloadImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;
    
    NSString* absoluteString = URL.absoluteString;
    
#ifdef dispatch_main_sync_safe
    if([[SDImageCache sharedImageCache] diskImageExistsWithKey:absoluteString])
    {
        UIImage* image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:absoluteString];
        if(!image)
        {
            NSData* data = [[SDImageCache sharedImageCache] performSelector:@selector(diskImageDataBySearchingAllPathsForKey:) withObject:URL.absoluteString];
            image = [UIImage imageWithData:data];
        }
        if(image)
        {
            return image.size;
        }
    }
#endif
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self downloadPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self downloadGIFImageSizeWithRequest:request];
    }
    else{
        size = [self downloadJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
#ifdef dispatch_main_sync_safe
            [[SDImageCache sharedImageCache] storeImage:image recalculateFromImage:YES imageData:data forKey:URL.absoluteString toDisk:YES];
#endif
            size = image.size;
        }
    }
    return size;
}
+(CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
+(CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
+(CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}+(NSString*)getImageUrl:(NSString *)url witdh:(int)withd withtHeight:(int)height{
    
    NSString* phpAddress = @"http://www.dlb666.com/index.php/ImagesClass-setThumbs-url-";
    //php裁剪图片前缀   +url base64 编码  然后 -w-100-h-100 来设置图片尺寸
    
    //将图片URL地址 通过base64编码
    NSString* urlBase64 = [[url dataUsingEncoding:NSASCIIStringEncoding] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    
    //按对应格式进行拼接
    NSString* imageUrl = [NSString stringWithFormat:@"%@%@-w-%d-h-%d",phpAddress,urlBase64,withd,height];
    return imageUrl;
    
}

//隐藏分割线
+ (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    //    [tableView setTableHeaderView:view];
    
    
}
//判断网络是否存在
+(BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork = YES;
    Reachability * network = [Reachability reachabilityWithHostname:@"www.apple.com"];
    switch ([network currentReachabilityStatus])
    {
        case NotReachable:
            isExistenceNetwork=NO;
            break;
        case ReachableViaWWAN:
            
            isExistenceNetwork=YES;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork=YES;
            break;
    }
    
    return isExistenceNetwork;
    
}
//提示框
+(void)showAlertWithString:(NSString*)message{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
+ (UIWindow *)keyWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

//拨打电话
+(void)contactPhone:(NSString *)phone view:(UIView*)view
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [view addSubview:callWebview];
}



//获取设备xib
+ (id)loadNibName:(NSString *)name
{
#ifdef UNIVERSAL_DEVICES
    return [[[NSBundle mainBundle] loadNibNamed:[self deviceNibName:name] owner:NULL options:NULL] objectAtIndex:0];
#else
    return [[[NSBundle mainBundle] loadNibNamed:name owner:NULL options:NULL] objectAtIndex:0];
#endif
}
+ (id)loadStoryboardName:(NSString *)name ViewName:(NSString*)viewname
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
    return  [storyBoard instantiateViewControllerWithIdentifier:viewname];
}
+ (void)GET:(NSString *)url params:(NSDictionary *)params superviewOfMBHUD:(UIView *)view success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure
{
    if (view != nil) {
        [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
      AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//     [mgr.requestSerializer setValue:@"bf33c3da243a2241c2f41c107e708d7e" forHTTPHeaderField:@"valfengtoken"];
      [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary*responseObj) {
          
          if (view != nil) {
              [MBProgressHUD hideHUDForView:view animated:YES];
          }
           success(responseObj);
         
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  if (failure) {
                      if (view != nil) {
                           [view makeToast:@"您的网络不稳定，请稍后重试！"];
                          [MBProgressHUD hideHUDForView:view animated:YES];
                      }
                            failure(error);
            }
       }];
}
+ (void)POST:(NSString *)url params:(NSDictionary *)params superviewOfMBHUD:(UIView *)view success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure
{
    DLog(@"------url=========%@",url);
    
    if (view != nil) {
        [Tools showHUDAddedTo:view animated:YES];
    }
 
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
   
//    [mgr.requestSerializer setValue:@"bf33c3da243a2241c2f41c107e708d7e" forHTTPHeaderField:@"valfengtoken"];
  
    [mgr POST:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary*responseObj) {
        
        if (view != nil) {
            [Tools showHUDAddedTo:view animated:NO];
        }
        success(responseObj);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            if (view != nil) {
                [view makeToast:@"您的网络不稳定，请稍后重试！"];
                 [Tools showHUDAddedTo:view animated:NO];
            }
            failure(error);
        }
        
    }];
}
+(NSString*)getCurrentDateWithSystemLocalZone{
    
   
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];

    return dateString;
 
}


+(NSString*)getUuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString); return result;
}

+(BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    
    
    
    return [comp1 day]   == [comp2 day] &&
    
    [comp1 month] == [comp2 month] &&
    
    [comp1 year]  == [comp2 year];
    
}

//判断是否为电话号码
+ (BOOL)isMobileNumber:(NSString *)telephoneNum{
    //中国移动
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    //中国联通
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    //中国电信
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //大陆地区固话及小灵通
    //    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    if (([regextestmobile evaluateWithObject:telephoneNum] == YES) || ([regextestcm evaluateWithObject:telephoneNum] == YES) || ([regextestcu evaluateWithObject:telephoneNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

//判断是否为邮箱
+ (BOOL)isEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end