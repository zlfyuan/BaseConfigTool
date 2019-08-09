//
//  UIImage+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/5/23.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

- (BOOL)isGIF;

+ (UIImage *)sd_animatedGIFNamed:(NSString *)name;

/**
 1 byte = 8 bits
 1KiB= 1,024 bytes
 1MiB= 1,048,576 bytes
 1GiB= 1,073,741,824 bytes
 1TiB= 1,099,511,627,776 bytes
 @param image 要压缩的图片
 @param maxLength 单位为 bytes
 @return 图片data
 */
+ (NSData *)zy_compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;

/**
 1 byte = 8 bits
 1KiB= 1,024 bytes
 1MiB= 1,048,576 bytes
 1GiB= 1,073,741,824 bytes
 1TiB= 1,099,511,627,776 bytes
 @param maxLength  单位为 bytes
 @return 图片
 */
- (UIImage *)zy_compressImagetoByte:(NSUInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
