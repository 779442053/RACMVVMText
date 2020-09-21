//
//  RACSignalViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "RACSignalViewController.h"

@interface RACSignalViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NameTF;

@property (weak, nonatomic) IBOutlet UITextField *AgeTF;

@property (weak, nonatomic) IBOutlet UILabel *NameLB;

@property (weak, nonatomic) IBOutlet UILabel *AgeLB;

@property (weak, nonatomic) IBOutlet UIButton *SubBtn;

@end

@implementation RACSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //处理事件
    [self handlingEvents];
}
#pragma mark - 处理事件 -
-(void)handlingEvents{
    @weakify(self);
    //按钮点击
    [[self.SubBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //@strongify(self);
        ZWWLog(@"按钮点击了 = %@",x);
    }];
    //name输入框输入内容实时监听
    [[self.NameTF rac_textSignal] subscribeNext:^(id x) {
        ZWWLog(@"name输入框= %@",x);
    }];
    //年龄输入框输入内容实时监听
    [[self.AgeTF rac_textSignal] subscribeNext:^(id x) {
        NSLog(@"年龄输入框 =%@",x);
    }];
    //信号组合获取,注意将id类型改为RACTuple
    [[RACSignal combineLatest:@[self.NameTF.rac_textSignal,self.AgeTF.rac_textSignal]] subscribeNext:^(RACTuple *x) {
        NSString * name = x.first;
        NSString * age = x.second;
        ZWWLog(@"name:%@,age:%@",name,age);
    }];
    
    //根据textfield内容决定按钮是否可以点击
    // reduce 中，可以通过接收的参数进行计算，并且返回需要的数值！
    [[RACSignal combineLatest:@[self.NameTF.rac_textSignal,self.AgeTF.rac_textSignal] reduce:^id(NSString * name , NSString * age){
        
        return @(name.length>0&&age.length>0);
        
    }] subscribeNext:^(id x) {
        @strongify(self);
        ZWWLog(@"按钮是否可以点击 = %d",[x boolValue])
        self.SubBtn.enabled = [x boolValue];
        
    }];
    
    
    
}
/**
 //一般双向绑定是指UI控件和模型互相绑定的,一般是在在改变一个值的情况下另外一个对象也会改变,类似KVO;
 //这里为了更好的体现出效果所以采用了textfield绑定到模型,模型绑定到label的做法
 
 RAC(self.lb_name,text)=RACObserve(model, name);
 
 #warning 这里不能使用基本数据类型,RAC中传递的都是id类型,使用基本类型会崩溃
 RAC(self.lb_age,text)=[RACObserve(model, age) map:^id(id value) {
     return [value description];
 }];
 //模型到UI
 [[RACSignal combineLatest:@[self.tf_name.rac_textSignal,self.tf_age.rac_textSignal]] subscribeNext:^(RACTuple * x) {
     
     model.name = x.first;
     model.age = [x.second intValue];
 }];
 
 */
#warning RAC在使用的时候由于系统提供的信号是始终存在的,所以在block中使用属性或者成员变量几乎都会涉及到一个循环引用的问题,有两种方法可以解决,使用weakself解决或者RAC提供的weak-strong dance
//在 block 的外部使用 @weakify(self)
//在 block 的内部使用 @strongify(self)
-(void)dealloc{
    NSLog(@"已销毁");
}
@end
