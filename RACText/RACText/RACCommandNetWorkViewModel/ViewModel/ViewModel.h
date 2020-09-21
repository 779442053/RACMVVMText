//
//  ViewModel.h
//  RACText
//
//  Created by step_zhang on 2020/9/17.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
//这里需要对command进行强引用,否则无法执行
@property(nonatomic,strong)RACCommand * command;
@end

NS_ASSUME_NONNULL_END
