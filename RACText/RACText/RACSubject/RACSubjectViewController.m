//
//  RACSubjectViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//
/**
 
 RACSubject :  使用场景
 1.cell 上面的btn 点击, 可以将点击cell 对应的模型传递到VC(cell上多个btn点击,可以传递回来字典,code标记究竟点击的哪一个btn)
 2.代替Block或者代理. 反向传值
 
 
 RACReplaySubject  对于订阅和发送信号的顺序掌握的比较宽松,可以先发送信号在进行订阅也可以
 我不经常用
 
 */
#import "RACSubjectViewController.h"
#import "SubjectSecondVC.h"
@interface RACSubjectViewController ()
@property(nonatomic,strong)RACSubject * subject;
@end

@implementation RACSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RACSubjectDelegate";
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)BtnClick:(UIButton *)sender {
    SubjectSecondVC * vc = [[SubjectSecondVC alloc] init];
    RACSubject * subject = [RACSubject subject];
     //将即将跳转的控制器对其RACSubject属性进行赋值,如果跳转页要让他的代理来做什么只需要发送响应的信号就可以了
    vc.delagetaSubject = subject;
    self.subject = subject;
    //这里有个原则,那就是还是要先订阅在发送信号
    [self getInfo];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 订阅信号 -
-(void)getInfo{
    [self.subject subscribeNext:^(id x) {
        ZWWLog(@"%@",x);
    } error:^(NSError *error) {
        ZWWLog(@"%@",error);
    } completed:^{
        ZWWLog(@"完成");
    }];
}

@end
