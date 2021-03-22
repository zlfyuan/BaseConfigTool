//
//  UIFont+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (UIFont *)systemScaleFont:(CGFloat)fontSize{
    CGFloat scale_device = [UIScreen mainScreen].bounds.size.width / 750;
    return [UIFont systemFontOfSize:scale_device * fontSize];
}
+ (UIFont *)systemblodScaleFont:(CGFloat)fontSize{
    CGFloat scale_device = [UIScreen mainScreen].bounds.size.width / 750;
    return [UIFont boldSystemFontOfSize:scale_device * fontSize];
}
@end
