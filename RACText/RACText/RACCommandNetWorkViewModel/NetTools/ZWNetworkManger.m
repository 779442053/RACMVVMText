//
//  ZWNetworkManger.m
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "ZWNetworkManger.h"

@implementation ZWNetworkManger
//三种解析json格式
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
    return self;
}
+(instancetype)shareManager{
    static ZWNetworkManger * _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}
@end
