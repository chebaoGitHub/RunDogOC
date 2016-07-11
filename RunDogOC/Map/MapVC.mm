//
//  MapVC.m
//  RunDogOC
//
//  Created by chebao on 16/7/7.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import "MapVC.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

//#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

//#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件

#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件

//#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件

//#import < BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface MapVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property (nonatomic,strong) BMKMapView * mapView;
@property (nonatomic,strong) BMKLocationService * locService;
@property (nonatomic,strong) UISegmentedControl * segment;
@property (nonatomic,strong) BMKUserLocation * currentLocation;
@property (nonatomic,strong) BMKPointAnnotation * myNotation;
@end

@implementation MapVC

- (void)viewWillAppear:(BOOL)animated{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addMapView];//添加基础地图
    
    [self addLocService];//添加定位服务
    
    [self startLocation];//开始定位当前位置
    
    [self showCurrentSit];//显示当前位置
    
    [self addView];
    
}

#pragma mark- view
-(void)addView{
    [self.view addSubview:self.segment];
    [self.segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];

}

-(UISegmentedControl *)segment{
    if (_segment) {
        return _segment;
    }else{
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"狗狗",@"铲屎官"]];
        _segment.selectedSegmentIndex = 0;
        return _segment;
    }
}

#pragma mark- base map
//add base map
-(void)addMapView{
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
}

//add location service
-(void)addLocService{
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
}

//开始进行定位
-(IBAction)startLocation{
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
}

//进入跟随模式
-(void)showCurrentSit{
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    
    [self setTheScale];
}

-(void)setTheScale{
    CLLocationCoordinate2D center = _locService.userLocation.location.coordinate;
    NSLog(@"%f=======%F",center.latitude,center.longitude);
    BMKCoordinateSpan span = BMKCoordinateSpanMake(0.038325, 0.028045);
    _mapView.region = BMKCoordinateRegionMake(center, span);
    
}

-(void)addNotation{
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = _locService.userLocation.location.coordinate;
    annotation.title = @"这里是杭州";
    [_mapView addAnnotation:annotation];
}


#pragma mark- map delegate
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
//    NSLog(@"heading is %@",userLocation.heading);
    [_mapView updateLocationData:userLocation];
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
