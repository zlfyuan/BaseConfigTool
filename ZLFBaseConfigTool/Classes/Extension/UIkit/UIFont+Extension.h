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

+ (UIFont *)systemScaleFont:(CGFloat)fontSize;

+ (UIFont *)systemblodScaleFont:(CGFloat)fontSize;

+ (UIFont *)systemSemiboldScaleFont:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
