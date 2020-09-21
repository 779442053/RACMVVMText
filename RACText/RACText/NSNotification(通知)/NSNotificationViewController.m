//
//  NSNotificationViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "NSNotificationViewController.h"

@interface NSNotificationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTF;

@end

@implementation NSNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getNotification];
    // Do any additional setup after loading the view from its nib.
}
-(void)getNotification{
    //代替通知
    //takeUntil会接收一个signal,当signal触发后会把之前的信号释放掉
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidShowNotification object:nil] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        ZWWLog(@"键盘弹出");
    }];
    
    //这里这样写只是为了给大家开拓一种思路,selector的方法可以应需求更改,即当这个方法执行后,产生一个信号告知控制器释放掉这个订阅的信号
    RACSignal * deallocSignal = [self rac_signalForSelector:@selector(viewWillDisappear:)];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"notifionName" object:nil] takeUntil:deallocSignal] subscribeNext:^(id x) {
        ZWWLog(@"haha");
    }];
}
- (IBAction)SendNotifion:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifionName" object:nil userInfo:nil];
}
-(void)dealloc{
    ZWWLog(@"控制器销毁");
}

@end
