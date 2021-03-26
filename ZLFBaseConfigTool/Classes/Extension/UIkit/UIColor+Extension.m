//
//  UIColor+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/8.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)


/// 进制颜色转化
/// @param hexString 类似 "#ffffff" "0x3f33fe"
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    //去除空格
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]]
                         uppercaseString];
    //把开头截取
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    //6位或8位(带透明度)
    if ([cString length] < 6) {
        return nil;
    }
    //取出透明度、红、绿、蓝
    unsigned int a, r, g, b;
    NSRange range;
    range.location = 0;
    range.length = 2;
    if (cString.length == 8) {
        //a
        NSString *aString = [cString substringWithRange:range];
        //r
        range.location = 2;
        NSString *rString = [cString substringWithRange:range];
        //g
        range.location = 4;
        NSString *gString = [cString substringWithRange:range];
        //b
        range.location = 6;
        NSString *bString = [cString substringWithRange:range];
        
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:(r / 255.0f)
                               green:(g / 255.0f)
                                blue:(b / 255.0f)
                               alpha:(a / 255.0f)];
    } else {
        //r
        NSString *rString = [cString substringWithRange:range];
        //g
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        //b
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:(r / 255.0f)
                               green:(g / 255.0f)
                                blue:(b / 255.0f)
                               alpha:1.0];
    }
}

/// 随机色
+ (UIColor *)arcColor {
    return [UIColor colorWithRed:(arc4random_uniform(256))/255.0
                           green:(arc4random_uniform(256))/255.0
                            blue:(arc4random_uniform(256))/255.0
                           alpha:(arc4random_uniform(256))/255.0];
}

@end
