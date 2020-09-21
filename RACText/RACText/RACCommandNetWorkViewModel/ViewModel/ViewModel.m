//
//  ViewModel.m
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "ViewModel.h"
#import "ZWRequestTool.h"
@implementation ViewModel
//这里使用懒加载对command赋值
-(RACCommand *)command{
    
    if (nil == _command) {
        
        [self loadInfo];
    }
    return _command;
}
-(void)loadInfo{
    
    //input就是控制器中,viewmodel执行command时excute传入的参数,
    //==一般传入字典,这样,就可以保证多个参数传入,或者传入模型,格局模型属性,在这里进行请求包体的封装
    RACCommand * command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        //需要注意强引用和弱引用
        //command必须有信号返回值,如果没有的话可以为[RACSignal empty]
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
        {
            NSMutableDictionary * params = [NSMutableDictionary dictionary];
            params[@"build"] = @"3360";
            params[@"channel"] = @"appstore";
            params[@"plat"] = @"2";
            [ZWRequestTool GET:@"http://app.bilibili.com/x/banner" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                //发送完信号必须发送完成信号,否则无法执行
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [subscriber sendError:error];
                //最好也走一遍  sendCompleted
                
            }];
            
            return [RACDisposable disposableWithBlock:^{
                
                [ZWRequestTool cancel];
                //请求任务结束,可以取消当前任务,在请求工具里面,去判断当前请求是哪个请求
                //根据url和参数, 是否相同,判断请求是否是同一个请求.
                ZWWLog(@"这里面可以写取消请求,完成信号后请求会取消");
                
            }];
        }];
    }];
    
    //必须强引用这个command,否则无法执行
    self.command = command;
    
}
@end
