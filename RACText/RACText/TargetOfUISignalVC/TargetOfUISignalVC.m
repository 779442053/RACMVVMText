//
//  TargetOfUISignalVC.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "TargetOfUISignalVC.h"

@interface TargetOfUISignalVC ()
@property (weak, nonatomic) IBOutlet UITextField *InputTextField;

@end

@implementation TargetOfUISignalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //textField输入内容的实时监听
    //订阅信号,订阅输入框的值改变 = 类似于UITextField addtarget
    [[self.InputTextField rac_textSignal] subscribeNext:^(id x) {
        ZWWLog(@"输入框 = %@",x);
        //可以在这里,限制输入框输入字符数量.lb:只能输入手机号11位
    }];
    //信号组合获取,注意将id类型改为RACTuple
    /**
     [[RACSignal combineLatest:@[self.tf_name.rac_textSignal,self.tf_age.rac_textSignal]] subscribeNext:^(RACTuple *x) {

         NSString * name = x.first;

         NSString * age = x.second;

         NSLog(@"name:%@,age:%@",name,age);

     }];
     
     
     //根据textfield内容决定按钮是否可以点击

     // reduce 中，可以通过接收的参数进行计算，并且返回需要的数值！

     [[RACSignal combineLatest:@[self.tf_name.rac_textSignal,self.tf_age.rac_textSignal] reduce:^id(NSString * name , NSString * age){

         return @(name.length>0&&age.length>0);

     }] subscribeNext:^(id x) {

         @strongify(self);

         self.btn_event.enabled = [x boolValue];
        //微信登录时候,当你输入好账号,然后不输入密码,登录按钮灰色且不可点击,当你输入一个
     密码时候,登录按钮立即变成绿色,可点击状态
     
     */
}



@end
