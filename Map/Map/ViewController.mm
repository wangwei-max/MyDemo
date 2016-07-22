//
//  ViewController.m
//  Map
//
//  Created by max on 16/7/21.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>




@interface ViewController () <BMKMapViewDelegate,BMKLocationServiceDelegate,UITextFieldDelegate,BMKPoiSearchDelegate>
{
    BMKMapView* _mapView;
    UIButton *_btnroad;
    BMKLocationService *_locService;
    UITextField* _cityText;
    UITextField* _keyText;
    UIButton* _nextPageButton;
    BMKPoiSearch* _poisearch;
    UIView *_topBgview;
}
@end

@implementation ViewController
-(void)notifes
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                            name:UIKeyboardWillShowNotification
                                            object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                            name:UIKeyboardWillHideNotification
                                               object:nil];
}
-(void)addsubViews
{
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-90)];
    [self.view addSubview:_mapView];

    
    _topBgview = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mapView.frame), [UIScreen mainScreen].bounds.size.width, 90)];
    _topBgview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_topBgview];
    
    //    显示模式按钮
    UIButton *btnNone = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNone.frame = CGRectMake(2, 2, 80, 40);
    [btnNone addTarget:self action:@selector(BMKMapTypeNoneClick) forControlEvents:UIControlEventTouchUpInside];
    btnNone.backgroundColor= [UIColor redColor];
    [btnNone setTitle:@"显示模式" forState:UIControlStateNormal];
    [_topBgview addSubview:btnNone];
    //    路况按钮
    _btnroad = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnroad.frame = CGRectMake(CGRectGetMaxX(btnNone.frame)+10, 2, 60, 40);
    [_btnroad addTarget:self action:@selector(RoadClick:) forControlEvents:UIControlEventTouchUpInside];
    _btnroad.backgroundColor= [UIColor redColor];
    _btnroad.userInteractionEnabled = YES;
    [_btnroad setTitle:@"路况开" forState:UIControlStateNormal];
    [_btnroad setTitle:@"路况关" forState:UIControlStateSelected];
    [_topBgview addSubview:_btnroad];
    
    //  显示模式按钮
    UIButton *locbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    locbtn.frame = CGRectMake(CGRectGetMaxX(_btnroad.frame)+10, 2, 60, 40);
    [locbtn addTarget:self action:@selector(locClick:) forControlEvents:UIControlEventTouchUpInside];
    locbtn.backgroundColor= [UIColor redColor];
    [locbtn setTitle:@"定位" forState:UIControlStateNormal];
    [locbtn setTitle:@"取消定位" forState:UIControlStateSelected];
    [_topBgview addSubview:locbtn];
    
    //搜索城市
    _cityText = [[UITextField alloc] init];
    _cityText.frame = CGRectMake(2, CGRectGetMaxY(btnNone.frame)+2, 60, 40);
    _cityText.backgroundColor = [UIColor redColor];
    _cityText.placeholder = @"城市";
    _cityText.returnKeyType = UIReturnKeySearch;
    _cityText.delegate = self;
    [_topBgview addSubview:_cityText];

    //具体地址搜索
    _keyText = [[UITextField alloc] init];
    _keyText.frame = CGRectMake(CGRectGetMaxX(_cityText.frame)+10, CGRectGetMaxY(btnNone.frame)+2, 80, 40);
    _keyText.backgroundColor = [UIColor redColor];
    _keyText.placeholder = @"地址";
    _keyText.returnKeyType = UIReturnKeySearch;
    _keyText.delegate = self;
    [_topBgview addSubview:_keyText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    [self addsubViews];
    [self notifes];
    
    

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;//显示定位图层
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

#pragma mark -- 按钮点击
//第一个按钮
-(void)BMKMapTypeNoneClick
{
    switch (_mapView.mapType) {
        case 0:
            _mapView.mapType = BMKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = BMKMapTypeSatellite;
            break;
        case 2:
            _mapView.mapType = BMKMapTypeNone;
            break;
        default:
            break;
    }
    
}
//第二个按钮
-(void)RoadClick:(UIButton *)sender
{
//    if ([sender.titleLabel.text isEqualToString:@"路况开"])
     if (!sender.selected)
    {
        [_mapView setTrafficEnabled:YES];
    }
    else
    {
        [_mapView setTrafficEnabled:NO];
    }
    sender.selected = !sender.selected;
//    NSLog(@"按钮currenttitle ＝＝＝%@",sender.titleLabel.text);
}
//3thbtn
-(void)locClick:(UIButton *)sender
{
    if (!sender.selected)
    {
        [_locService startUserLocationService];
        _mapView.showsUserLocation = NO;//先关闭显示的定位图层
        _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
        _mapView.showsUserLocation = YES;//显示定位图层
    }
    else
    {
        [_locService stopUserLocationService];
        _mapView.showsUserLocation = NO;
    }
    sender.selected = !sender.selected;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _cityText) {
        [textField endEditing:YES];
    }
    else
    {
        [textField endEditing:YES];
        _poisearch= [[BMKPoiSearch alloc]init];
        BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
        citySearchOption.pageIndex = 0;
        citySearchOption.pageCapacity = 10;
        citySearchOption.city= _cityText.text;
        citySearchOption.keyword = _keyText.text;
        BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
        NSLog(@"1--%@===2--%@",_cityText.text,_keyText.text);
        if(flag)
        {
            NSLog(@"城市内检索发送成功");
        }
        else
        {
            NSLog(@"城市内检索发送失败");
        }

    }
    
    return YES;
}

//#pragma mark -实现PoiSearchDeleage处理回调结果 
//-(void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode
//{
//    if (errorCode == BMK_SEARCH_NO_ERROR) {
//        //在此处理正常结果
//    }
//    else if (errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD){
//        //当在设置城市未找到结果，但在其他城市找到结果时，回调建议检索城市列表
//        // result.cityList;
//        NSLog(@"起始点有歧义");
//    } else {
//        NSLog(@"抱歉，未找到结果");
//    }
//}


#pragma mark implement BMKMapViewDelegate

/**
 *根据anntation生成对应的View
 *@param mapView 地图View
 *@param annotation 指定的标注
 *@return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        
        // 生成重用标示identifier
        NSString *AnnotationViewID = @"xidanMark";
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"renameMark"];
        
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        // 设置颜色
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        // 从天上掉下效果
        newAnnotationView.animatesDrop = YES;
        // 设置可拖拽
        newAnnotationView.draggable = YES;
        return newAnnotationView;
    }
    return nil;
}

#pragma mark -监听通知

- (void)keyboardWillShow:(NSNotification *)note
{
    //取得键盘弹出时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //取得键盘高度
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    //option的值设置为7 << 16会让view跟键盘弹出效果同步
    [UIView animateWithDuration:duration delay:0 options:7 << 16 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
    } completion:nil];
}

- (void)keyboardWillHide:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration delay:0 options:7 << 16 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
