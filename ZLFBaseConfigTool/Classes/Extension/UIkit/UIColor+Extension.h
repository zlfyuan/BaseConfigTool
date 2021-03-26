//
//  UIColor+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/8.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

/// 进制颜色转化
/// @param hexString 类似 "#ffffff" "0x3f33fe"
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/// 随机色
+ (UIColor *)arcColor;
@end

NS_ASSUME_NONNULL_END
