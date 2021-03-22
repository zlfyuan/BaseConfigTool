//
//  ZLFConstant.h
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Screen [UIScreen mainScreen].bounds
#define SWIDTH [UIScreen mainScreen].bounds.size.width
#define SHEIGHT [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define ZLFLog(...) ZLFLog(fmt,...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
//NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZLFLog(...)
#endif

#define ZLFWarring__METHOD_ATTRIBUTE(contentString) __attribute__((unavailable(contentString)));

#define WK(weakSelf)  __weak __typeof(&*self)weakSelf = self;


NS_ASSUME_NONNULL_BEGIN

@interface ZLFConstant : NSObject

@end

NS_ASSUME_NONNULL_END
