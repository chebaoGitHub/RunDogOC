//
//  AppDelegate.h
//  RunDogOC
//
//  Created by chebao on 16/7/7.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

////百度地图
//@interface BaiduMapApiDemoAppDelegate : NSObject <UIApplicationDelegate,BMKGeneralDelegate> {
//    UIWindow *window;
//    UINavigationController *navigationController;
//    BMKMapManager* _mapManager;
//}
//@end



@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>

@property (strong, nonatomic) UIWindow *window;




@end

