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


@interface ViewController () <BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView* _mapView;
    UIButton *_btnroad;
    BMKLocationService *_locService;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44)];
    UIView *topBgview = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_mapView.frame), [UIScreen mainScreen].bounds.size.width, 44)];
    topBgview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topBgview];
    
//    显示模式按钮
    UIButton *btnNone = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNone.frame = CGRectMake(2, 2, 80, 40);
    [btnNone addTarget:self action:@selector(BMKMapTypeNoneClick) forControlEvents:UIControlEventTouchUpInside];
    btnNone.backgroundColor= [UIColor redColor];
    [btnNone setTitle:@"显示模式" forState:UIControlStateNormal];
    [topBgview addSubview:btnNone];
//    路况按钮
    _btnroad = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnroad.frame = CGRectMake(CGRectGetMaxX(btnNone.frame)+10, 2, 80, 40);
    [_btnroad addTarget:self action:@selector(RoadClick:) forControlEvents:UIControlEventTouchUpInside];
    _btnroad.backgroundColor= [UIColor redColor];
    _btnroad.userInteractionEnabled = YES;
    [_btnroad setTitle:@"路况开" forState:UIControlStateNormal];
    [_btnroad setTitle:@"路况关" forState:UIControlStateSelected];
    [topBgview addSubview:_btnroad];
    
    //  显示模式按钮
    UIButton *locbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    locbtn.frame = CGRectMake(CGRectGetMaxX(_btnroad.frame)+10, 2, 80, 40);
    [locbtn addTarget:self action:@selector(locClick:) forControlEvents:UIControlEventTouchUpInside];
    locbtn.backgroundColor= [UIColor redColor];
    [locbtn setTitle:@"定位" forState:UIControlStateNormal];
    [locbtn setTitle:@"取消定位" forState:UIControlStateSelected];
    [topBgview addSubview:locbtn];
    
   [self.view addSubview:_mapView];

}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
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
@end
