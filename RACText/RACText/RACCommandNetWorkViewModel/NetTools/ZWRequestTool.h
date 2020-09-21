//
//  ZWRequestTool.h
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWNetworkManger.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZWRequestTool : NSObject
+ (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


+ (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

+ (void)cancel;
@end

NS_ASSUME_NONNULL_END
