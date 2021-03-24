//
//  NSString+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2021/3/8.
//  Copyright © 2021 1553427003@qq.com. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


/// url编码
- (NSString *)urlEncodeString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:
            [NSCharacterSet URLPathAllowedCharacterSet]];
}

/// url解码
- (NSString *)urlDecodeString {
    return [self stringByRemovingPercentEncoding];
}

/// 判断string是否为空 nil 、 NULL、 not String、 length、“ ”
- (BOOL)isEmpty {
    NSString *string = self;
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] == NO) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

/// 字符串是不是数字
- (BOOL)isNumber {
    return [self isInt] ||
    [self isInteger] ||
    [self isFloat] ||
    [self isDouble] ||
    [self isLongLong];
}

/// 判断是否包含中文
- (BOOL)containChinese {
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

#pragma mark - Prvite
- (BOOL)isInt {
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return ([scan scanInt:&val] && [scan isAtEnd]);
}


- (BOOL)isInteger {
    NSScanner *scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return ([scan scanInteger:&val] && [scan isAtEnd]);
}

- (BOOL)isFloat {
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    return ([scan scanFloat:&val] && [scan isAtEnd]);
}

- (BOOL)isDouble {
    NSScanner *scan = [NSScanner scannerWithString:self];
    double val;
    return ([scan scanDouble:&val] && [scan isAtEnd]);
}

- (BOOL)isLongLong {
    NSScanner *scan = [NSScanner scannerWithString:self];
    long long val;
    return ([scan scanLongLong:&val] && [scan isAtEnd]);
}
@end
