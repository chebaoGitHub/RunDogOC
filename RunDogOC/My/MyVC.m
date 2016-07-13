//
//  MyVC.m
//  RunDogOC
//
//  Created by chebao on 16/7/12.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import "MyVC.h"
#import "MyPersonCell.h"

@interface MyVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * table;
@end

@implementation MyVC

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    
    
    [self setNavTitle:@"个人中心"];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table = [[UITableView alloc] init];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

#pragma mark- table delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 74;
    }else{
        return 40;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MyPersonCell * cell = [[MyPersonCell alloc] init];
        return cell;
    }else{
        NSArray * titleArray = [[NSArray alloc] initWithObjects:
                                @"我的宠物",
                                @"遛狗委托",
                                @"遛狗申请",
                                @"遛狗记录",
                                @"投诉反馈",
                                @"关于我们",
                                @"清理缓存",
                                @"退出登录",
                                nil];
        NSArray * imageArray = [[NSArray alloc] initWithObjects:
                                @"myPet",
                                @"myWeiTuo",
                                @"myShenQing",
                                @"myList",
                                @"myTalk",
                                @"myAbout",
                                @"myClean",
                                @"myOut",
                                nil];
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row -1];
        cell.imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row -1]];
        return cell;
    }

}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
