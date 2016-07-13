//
//  ViewController.m
//  RunDogOC
//
//  Created by chebao on 16/7/7.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import "ViewController.h"

#import "MapVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MapVC * vc = [[MapVC alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
