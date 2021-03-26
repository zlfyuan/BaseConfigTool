//
//  ZLFImageButton.h
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 图片位置

 - ZYBtnStyleImageLeft: 图片在左边
 - ZYBtnStyleImageRight: 图片在右边
 - ZYBtnStyleImageUp: 图片在上边
 - ZYBtnStyleImageDown: 图片在下边
 */
typedef NS_ENUM(NSInteger,ZYBtnStyle){
    ZYBtnStyleImageLeft,
    ZYBtnStyleImageRight,
    ZYBtnStyleImageUp,
    ZYBtnStyleImageDown
};

/**
 文字内容-位置

 - ZYBtnContentStyleNone: 文字内容 无 默认
 - ZYBtnContentStyleLeft: 文字内容 在左边
 - ZYBtnContentStyleRight: 文字内容 在右边
 */
typedef NS_ENUM(NSInteger,ZYBtnContentStyle){
    ZYBtnContentStyleNone,
    ZYBtnContentStyleLeft,
    ZYBtnContentStyleRight,
};

/// 自定义UIButton
/// 可实现 内容位置的调整 文字内容    图片内容
@interface ZLFImageButton : UIButton
/**e内容样式*/
@property (nonatomic, assign) ZYBtnContentStyle contentStyle;
/**样式*/
@property (nonatomic,assign)ZYBtnStyle BtnStyle;
/**图文间距*/
@property (nonatomic,assign)CGFloat Space;

@end


NS_ASSUME_NONNULL_END
