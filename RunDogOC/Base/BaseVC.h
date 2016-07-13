//
//  BaseVC.h
//  RunDogOC
//
//  Created by chebao on 16/7/7.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Define.h"

@interface BaseVC : UIViewController
-(void)setNavTitle:(NSString *)title andBackButtonImage:(NSString *)imageName;
-(void)setNavTitle:(NSString *)title;
@end
