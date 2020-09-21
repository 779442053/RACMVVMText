//
//  DelegateViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "DelegateViewController.h"

@interface DelegateViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view from its nib.
}
-(void)setupUI{
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate) ] subscribeNext:^(RACTuple * x) {
        
        ZWWLog(@"点击了");
        ZWWLog(@"%@,%@",x.first,x.second);
        
    }];
    //这样子不带协议是无法代替代理的,虽然能达到效果,这个方法表示某个selector被调用时执行一段代码.带有协议参数的表示该selector实现了某个协议，所以可以用它来实现Delegate。
    //这里是个坑,必须将代理最后设置,否则信号是无法订阅到的
    //雷纯峰大大是这样子解释的:在设置代理的时候，系统会缓存这个代理对象实现了哪些代码方法
    //如果将代理放在订阅信号前设置,那么当控制器成为代理时是无法缓存这个代理对象实现了哪些代码方法的
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"点我";
    return cell;
    
}
@end
