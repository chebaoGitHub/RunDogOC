//
//  MyPersonCell.m
//  RunDogOC
//
//  Created by chebao on 16/7/12.
//  Copyright © 2016年 chebao. All rights reserved.
//

#import "MyPersonCell.h"
@implementation MyPersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self addHeaderView];
        
    }
    return self;
}

-(void)addHeaderView{
    //header
    UIView * view = [[UIView alloc] init];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(12);
        make.top.equalTo(self.contentView).with.offset(12);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"holder_head"]];
    [view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(changeHeader) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    //name
    UILabel * name = [[UILabel alloc] init];
    name.text = @"nikename";
    [self.contentView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_right).with.offset(8);
        make.top.mas_equalTo(self.contentView).with.offset(12);
        make.right.mas_equalTo(self.contentView).with.offset(-12);
        make.height.mas_equalTo(25);
    }];
    
    UILabel * introduce = [[UILabel alloc] init];
    introduce.text = @"I am a girl";
    [self.contentView addSubview:introduce];
    [introduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_right).with.offset(8);
        make.top.equalTo(name.mas_bottom).with.offset(0);
        make.right.equalTo(self.contentView).with.offset(-12);
        make.height.mas_equalTo(25);
    }];
}

-(void)changeHeader{
    NSLog(@"change the header");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
