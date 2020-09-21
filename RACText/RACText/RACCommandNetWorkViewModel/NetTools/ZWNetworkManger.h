//
//  ZWNetworkManger.h
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWNetworkManger : AFHTTPSessionManager
//获取单例
+(instancetype)shareManager;
@end

NS_ASSUME_NONNULL_END
