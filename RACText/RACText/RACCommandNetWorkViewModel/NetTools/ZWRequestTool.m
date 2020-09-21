//
//  ZWRequestTool.m
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "ZWRequestTool.h"

@implementation ZWRequestTool
+(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(id)parameters
                    progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    ZWNetworkManger * mgr = [ZWNetworkManger shareManager];
    NSURLSessionDataTask * DataTask =[mgr GET:URLString parameters:parameters headers:@{} progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    
    return DataTask;
}

+(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    ZWNetworkManger * mgr = [ZWNetworkManger shareManager];
    NSURLSessionDataTask * DataTask =[mgr POST:URLString parameters:parameters headers:@{} progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    
    return DataTask;
}

+(void)cancel{
    
    // 取消网络请求
    [[ZWNetworkManger shareManager].operationQueue cancelAllOperations];
    
    // 取消任务中的所有网络请求
    //    [[FYNetworkManger shareManager].tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 杀死Session
    //    [[FYNetworkManger shareManager] invalidateSessionCancelingTasks:YES];
    
}
@end
