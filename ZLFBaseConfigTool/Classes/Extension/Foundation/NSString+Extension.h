//
//  NSString+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2021/3/8.
//  Copyright © 2021 1553427003@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/// url编码
- (NSString *)urlEncodeString;

/// url解码
- (NSString *)urlDecodeString;

/// 判断string是否为空 nil 、 NULL、 not String、 length、“ ”
- (BOOL)isEmpty;

/// 字符串是不是数字
- (BOOL)isNumber;

/// 判断是否包含中文
- (BOOL)containChinese;
@end

NS_ASSUME_NONNULL_END
