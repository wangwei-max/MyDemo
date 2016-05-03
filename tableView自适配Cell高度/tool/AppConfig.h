//
//  AppConfig.h
//  MaiDeQi
//
//  Created by Peter on 15/2/4.
//  Copyright (c) 2015年 机锋科技. All rights reserved.
//

#ifndef MaiDeQi_AppConfig_h
#define MaiDeQi_AppConfig_h

// 手表设置  1 == YES
#define WATCH 0
 
//XMPP 配置
#define  XMPP_PORT 5222
#define  XMPP_IP_ADDRESS @""
#define  ServerRouterName  @""

#define backBarButton [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]
 
//系统通用宏
#define BFLocalizedString(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"Gfeng"]

#define DEVICE_WIDTH [[UIScreen mainScreen] bounds].size.width
#define DEVICE_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define ScreenMiddle (ScreenHight-64-self.tabBarController.tabBar.frame.size.height)
#define ScreenSubViewHight (ScreenHight-64)
#define ScreenMiddle_iPhone5 455  //iphone5 除去navi 和 tabBar的高度
#define DeviceIsIphone5 ([UIScreen mainScreen].bounds.size.height == 568?YES:NO)
#define DeviceIsIOS7 ([[[UIDevice currentDevice]systemVersion] floatValue]>=7.0? YES:NO)
#define SystemAppDelegate  (AppDelegate *)[UIApplication sharedApplication].delegate
#define safeSet(d,k,v) if (v) d[k] = v;

/**
 *  Get App name
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  Get App build
 */
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  Get App version
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 *  Get AppDelegate
 */
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//  主要单例
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define SharedApplication                   [UIApplication sharedApplication]

//设置加载图片 颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define loadImage(Name)  [UIImage   imageNamed:Name]
#define LineColor COLOR(223, 223, 223, 1)  //常用灰色线条的颜色

#define Back_W  30
#define Back_H  50
//颜色设置
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFormRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define backBarButton [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]
 
//信鸽推送
#define XGAppKey  @"I9G8Z26ILK9S"

// 友盟
#define UMENG_APPKEY @"5634d3bbe0f55ad04e000182"

//shareSDK
#define ShareSDKAPPKEY @"bfc3aab8aa50"

//新浪
#define SinaWBAppKey @"1529453946"
#define SinaWBURI    @"3105e0e6880a6e501c7566c2b1ab448d"

//微信
#define WXAppKey @"wx0c80e63495f04be9"
#define WXAppSecret @"d4624c36b6795d1d99dcf0547af5443d"

//QQ
#define QQAppID @"1104874083"
#define QQURI @"HGlpPjOdk8XW7yxm"

//AppID
#define AppID @"1060973985"

// IP地址
#define BaseUrl @"http://api.daydaycook.com.cn/daydaycook/server"//http://218.244.151.213/daydaycook/server//http://116.228.173.50:8189/daydaycook

#define userKeyUserInfo @"UserId"
#define seasonKeyInfo @"SeasonId"
#define accountKeyInfo @"Account"
#define nameKeyInfo @"RealName"
#define telKeyInfo @"Tel"
#define logonKeyInfo @"CompanyLogo"
#define BrandInfo @"BrandLogo"
#define SeasonName @"SeasonName"


#define Welcome     [UserDefaults objectForKey:@"Welcome"]
#define GuideView     [UserDefaults objectForKey:@"guide"]
#define GuideViewLogin     [UserDefaults objectForKey:@"guideLogin"]
#define DetailsUp     [UserDefaults objectForKey:@"detailsup"]
#define FindUp     [UserDefaults objectForKey:@"findup"]
#define NewsCount   [UserDefaults objectForKey:@"newsCount"]
//用户id
#define OpenID [[NSUserDefaults standardUserDefaults] objectForKey:userKeyUserInfo]

//订货季节
#define SeasonId [[NSUserDefaults standardUserDefaults] objectForKey:seasonKeyInfo]

//公司
#define Account [[NSUserDefaults standardUserDefaults] objectForKey:accountKeyInfo]

//昵称
#define Nickname [[NSUserDefaults standardUserDefaults] objectForKey:nameKeyInfo]
//电话
#define Tel [[NSUserDefaults standardUserDefaults] objectForKey:telKeyInfo]

//头像
#define logon [[NSUserDefaults standardUserDefaults] objectForKey:logonKeyInfo]

//商标
#define BrandLogo [[NSUserDefaults standardUserDefaults] objectForKey:BrandInfo]

//订货会标语
#define SeasonNameTitle [[NSUserDefaults standardUserDefaults] objectForKey:SeasonName]

//账号
#define UserName [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]

//密码
#define Password [[NSUserDefaults standardUserDefaults] objectForKey:@"password"]

// 首页
#define Url_HomePage(currentPage)[NSString stringWithFormat:@"%@/recipe/index.do?currentPage=%d&pageSize=10",BaseUrl,currentPage]

//登录
#define Url_Login(username,password)[NSString stringWithFormat:@"%@/user/login.do?userName=%@&password=%@&type=2",BaseUrl,username,password]

// 登录图片
#define Url_LoginImg [NSString stringWithFormat:@"%@/config/loginImage.do",BaseUrl]

// 获取验证码  忘记密码type ＝ 1、注册type ＝ 0
#define Url_AuthCodeLogin(Tel,type)[NSString stringWithFormat:@"%@/utils/getRegCode.do?username=%@&type=%@",BaseUrl,Tel,type]

// 注册
#define Url_Register(Tel,password,Code,loginType,nickName,image)[NSString stringWithFormat:@"%@/user/registered.do?userName=%@&password=%@&code=%@&type=2&loginType=%d&nickName=%@&image=%@",BaseUrl,Tel,password,Code,loginType,nickName,image]

// 完善个人信息（注册第二步）
#define Url_PerfectUserInfo(image,nickName) [NSString stringWithFormat:@"%@/user/newregistered.do?id=%@&image=%@&nickName=%@&username=%@&password=%@",BaseUrl,OpenID,image,nickName,UserName,Password]

// 修改个人信息
#define Url_ModifyUserInfo(image,nickName) [NSString stringWithFormat:@"%@/user/upduser.do?username=%@&password=%@&image=%@&nickName=%@",BaseUrl,UserName,Password,image,nickName]

// 上传图片username=%@&password=%@ ,UserName,Password
#define Url_UploadImg [NSString stringWithFormat:@"%@/utils/upload.do?",BaseUrl]

// 忘记密码
#define Url_ModifyPassword(userName,code,password)[NSString stringWithFormat:@"%@/user/retrievePassword.do?userName=%@&code=%@&password=%@",BaseUrl,userName,code,password]

// 发现
#define Url_Find(currentPage)[NSString stringWithFormat:@"%@/recipe/index.do?currentPage=%d&pageSize=10",BaseUrl,currentPage]

// 发现分类菜谱
#define Url_FindClass(currentPage,categoryID,screeningId,parentId)[NSString stringWithFormat:@"%@/recipe/searchScreening.do?currentPage=%d&pageSize=10&categoryID=%@&screeningId=%@&parentId=%@",BaseUrl,currentPage,categoryID,screeningId,parentId]

// 一级分类
#define Url_OneClass [NSString stringWithFormat:@"%@/category/categoryList.do",BaseUrl]

// 二级分类
#define Url_TwoClass(parentid)[NSString stringWithFormat:@"%@/category/parentList.do?parentid=%@",BaseUrl,parentid]


// 筛选二级分类
#define Url_FilterTwoClass(parentid) [NSString stringWithFormat:@"%@/screening/parentList.do?parentid=%@",BaseUrl,parentid]

// 详情
#define Url_Details(id,username,password) [NSString stringWithFormat:@"%@/recipe/details.do?id=%@&username=%@&password=%@",BaseUrl,id,username,password]

// 统计分享次数
#define Url_ShareCount(id) [NSString stringWithFormat:@"%@/recipe/sharecount.do?id=%@",BaseUrl,id]

// 判断是否收藏过此产品
#define Url_IfFavorite(recipeId)[NSString stringWithFormat:@"%@/favorite/ifFavorite.do?recipeId=%@&username=%@&password=%@",BaseUrl,recipeId,UserName,Password]

// 添加收藏
#define Url_AddCollect(recipeId)[NSString stringWithFormat:@"%@/favorite/addFavorite.do?recipeId=%@&username=%@&password=%@",BaseUrl,recipeId,UserName,Password]

// 删除收藏
#define Url_DeleteCollect(recipeId)[NSString stringWithFormat:@"%@/favorite/delFavorite.do?recipeId=%@&username=%@&password=%@",BaseUrl,recipeId,UserName,Password]

// 评价列表
#define Url_CommentList(recipeId,currentPage)[NSString stringWithFormat:@"%@/comment/commentList.do?recipeId=%@&username=%@&password=%@&currentPage=%d&pageSize=10",BaseUrl,recipeId,UserName,Password,currentPage]

// 评价列表数
#define Url_CommentListCount [NSString stringWithFormat:@"%@/message/Messagenum.do?username=%@&password=%@",BaseUrl,UserName,Password]

// 点评
#define Url_Comment(content,recipeId,imgpaths)[NSString stringWithFormat:@"%@/comment/addComment.do?content=%@&recipeId=%@&imgpaths=%@&username=%@&password=%@",BaseUrl,content,recipeId,imgpaths,UserName,Password]

// 搜索
#define Url_Search(name,currentPage)[NSString stringWithFormat:@"%@/recipe/search.do?name=%@&currentPage=%d&pageSize=10",BaseUrl,name,currentPage]

// 我的消息
#define URL_MyNews(currentPage) [NSString stringWithFormat:@"%@/message/userMessage.do?currentPage=%d&pageSize=10&username=%@&password=%@",BaseUrl,currentPage,UserName,Password]

// 我的消息详情
#define URL_MyNewsDetails(id) [NSString stringWithFormat:@"http://218.244.151.213/daydaycook/h5/recipe/loadMessage.do?id=%@&username=%@&password=%@",id,UserName,Password]

// 我的收藏
#define URL_MyCollect(currentPage) [NSString stringWithFormat:@"%@/favorite/userFavorite.do?currentPage=%d&pageSize=10&username=%@&password=%@",BaseUrl,currentPage,UserName,Password]

// 我的收藏总数
#define URL_MyCollectAllNumber [NSString stringWithFormat:@"%@/favorite/userFavoriteNumber.do?username=%@&password=%@",BaseUrl,UserName,Password]

// 浏览记录
#define URL_BrowsingHistory(currentPage) [NSString stringWithFormat:@"%@/browserecord/userBrowserecord.do?currentPage=%d&pageSize=30&username=%@&password=%@",BaseUrl,currentPage,UserName,Password]

// 清空浏览记录
#define URL_ClearBrowsingHistory [NSString stringWithFormat:@"%@/browserecord/delBrowserecord.do?username=%@&password=%@",BaseUrl,UserName,Password]

// 我的评价
#define URL_MyComment(currentPage) [NSString stringWithFormat:@"%@/comment/userComment.do?currentPage=%d&pageSize=10&username=%@&password=%@",BaseUrl,currentPage,UserName,Password]

// 删除我的评价
#define URL_DeleteMyComment(ids) [NSString stringWithFormat:@"%@/comment/delComment.do?ids=%@&username=%@&password=%@",BaseUrl,ids,UserName,Password]

// 意见反馈
#define URL_Feedback(content,contacts) [NSString stringWithFormat:@"%@/opinion/saveopinion.do?username=%@&password=%@&content=%@&contacts=%@",BaseUrl,UserName,Password,content,contacts]

// 常见问题
#define URL_Problem [NSString stringWithFormat:@"http://218.244.151.213/daydaycook/h5/recipe/loadProblem.do?username=%@&password=%@",UserName,Password]

// 刷新点击数和分享数
#define URL_Browse(id) [NSString stringWithFormat:@"%@/recipe/clickShareCount.do?id=%@",BaseUrl,id]

// 关于日日煮
#define URL_AboutUs [NSString stringWithFormat:@"%@/about/list.do",BaseUrl]

// 启动视频
#define URL_Video [NSString stringWithFormat:@"%@/guide/list.do",BaseUrl]

// 上传唯一标识符
#define URL_Identifier(mobileSn) [NSString stringWithFormat:@"%@/mobileMark/save.do?mobileSn=%@&platform=ios",BaseUrl,mobileSn]

// 批量删除收藏
#define URL_DeleteCollection(ids) [NSString stringWithFormat:@"%@/favorite/del.do?username=%@&password=%@&ids=%@",BaseUrl,UserName,Password,ids]

// 新搜索 广告
#define URL_ListAds [NSString stringWithFormat:@"%@/ad/listAds.do",BaseUrl]

// 标签接口
#define URL_TagsList [NSString stringWithFormat:@"%@/tag/list.do",BaseUrl]

// 搜索新接口
#define URL_Search(currentPage,name,screeningId,tagId,username,password) [NSString stringWithFormat:@"%@/recipe/search.do?currentPage=%d&pageSize=20&name=%@&categoryId=&parentId=&screeningId=%@&tagId=%@&username=%@&password=%@",BaseUrl,currentPage,name,screeningId,tagId,username,password]

 

#define DEF_SCREEN_WID [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_HI [UIScreen mainScreen].bounds.size.height

#define NAVBAR_HI 44.0f
#define TABBAR_HI 40.0f
#define STATUSBAR_HI 20.0f
#define Scale2X DEF_SCREEN_WID/320.0f
#define STATIC_FRAME_TABS_NAV CGRectMake(0, 0, DEF_SCREEN_WID, DEF_SCREEN_HI-NAVBAR_HI-STATUSBAR_HI-TABBAR_HI)
#define STATIC_FRAME_NAV CGRectMake(0, 0, DEF_SCREEN_WID, DEF_SCREEN_HI-NAVBAR_HI-STATUSBAR_HI)
#define STATIC_FRAME_TABS CGRectMake(0, 0, DEF_SCREEN_WID, DEF_SCREEN_HI-TABBAR_HI)
#define STATIC_FRAME CGRectMake(0, 0, DEF_SCREEN_WID, DEF_SCREEN_HI)

#ifdef DEBUG
#define DLog(s, ...) NSLog(@"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog(s, ...)
#endif

#endif

