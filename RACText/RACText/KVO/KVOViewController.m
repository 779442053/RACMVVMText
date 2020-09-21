//
//  KVOViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    
    [self.view addSubview:scrollView];
    
    UIView * contentView = [[UIView alloc]init];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
        make.width.height.equalTo(@1000);
    }];
    
    //代替KVO
    [RACObserve(scrollView, contentOffset) subscribeNext:^(id x) {
        ZWWLog(@"%@",x);
    }];
    
    
}


@end
