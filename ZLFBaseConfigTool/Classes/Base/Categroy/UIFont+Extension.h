//
//  UIFont+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Extension)

/**
 参照iphone 6 的 分辨率 的 比例

 @param fontSize 字体大小 1px = 2pt
 @return font
 */
+ (UIFont *)systemScaleFont:(CGFloat)fontSize;
+ (UIFont *)systemblodScaleFont:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
