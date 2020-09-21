//
//  TimeViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)Text1:(UIButton *)sender {
    //五秒后执行一次
    [[RACScheduler mainThreadScheduler]afterDelay:5 schedule:^{
        
        ZWWLog(@"五秒后执行一次");
    }];
}
- (IBAction)Text2:(UIButton *)sender {
    //每隔两秒执行一次
    //这里要加takeUntil条件限制一下否则当控制器pop后依旧会执行
    [[[RACSignal interval:2 onScheduler:[RACScheduler mainThreadScheduler]] takeUntil:self.rac_willDeallocSignal ] subscribeNext:^(id x) {
        
        ZWWLog(@"每两秒执行一次");
    }];
}



@end
