//
//  RACCommandVC.m
//  RACText
//
//  Created by step_zhang on 2020/9/21.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "RACCommandVC.h"
#import "ViewModel.h"
@interface RACCommandVC ()

@end

@implementation RACCommandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewModel * vm = [[ViewModel alloc]init];
    
    //取到command信号中的信号,对其进行订阅
    [vm.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        ZWWLog(@"%@",x);
    } error:^(NSError *error) {
        ZWWLog(@"%@",error);
    } completed:^{
        ZWWLog(@"完成");
    }];
    
    //取到command信号
    [vm.command.executionSignals subscribeNext:^(id x) {
        
        ZWWLog(@"-------------------------%@",[x class]);
        
        ZWWLog(@"这里获取到的x是一个带有数据的信号,需要对x做进一步订阅就可以获取到数据如上所示");
        
    }];
    
    //监听命令是否完成
    [vm.command.executing subscribeNext:^(id x) {
       
        //这里的x是一个带有数据的信号,若这个信号存在那么就说明command还在执行,否则说明没有执行或者执行完毕
        if ([x boolValue]) {
            ZWWLog(@"正在执行");
        } else {
            ZWWLog(@"执行未开始/执行完毕");
        }
    }];
    
    
    //必须要加这句话,否则command无法执行,excute传的参数若无用可以为nil,传的参数就是viewModel中RACCommand中block的input值,根据这个值我们可以做许多事情
    //例如,封装一个tableview的翻页请求,每次翻页的时候可以通过excute把翻页的页码给他
    [vm.command execute:nil];
    
    
    /**======================一般的请求是这样子处理的=======================*/
    /**
     @{}:  我本次请求需要的请求参数,传递到vm里面,可以为空
     id  _Nullable x:   请求结果,可以是空或者 error   只要不是基本数据类型
     id  _Nullable x:一般是字典,在vm里面进行创建和实现,
     */
//    [[vm.command execute:@{}]subscribeNext:^(id  _Nullable x) {
//        if ([x[@"code"] intValue] == 0) {
//            //代表请求成功.接下来开始取请求结果
//            NSArray *resultARR = x[@"res"];
//            //改变UI ..注意循环引用
//        }
//    }];
    
    
    
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
