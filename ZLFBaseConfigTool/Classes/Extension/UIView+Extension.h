//
//  UIView+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/2.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 边框类型枚举

 - UIBorderSideTypeAll: all
 - UIBorderSideTypeTop: 上
 - UIBorderSideTypeBottom: 下
 - UIBorderSideTypeLeft: 左
 - UIBorderSideTypeRight: 右
 */
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};


typedef void(^tapCallBlock)(UITapGestureRecognizer * _Nonnull tap);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat z_x;
@property (nonatomic, assign) CGFloat z_y;
@property (nonatomic, assign) CGFloat z_width;
@property (nonatomic, assign) CGFloat z_height;
@property (nonatomic, assign) CGFloat z_centerX;
@property (nonatomic, assign) CGFloat z_centerY;
@property (nonatomic, assign) CGSize  z_size;
@property (nonatomic, assign) CGPoint z_origin;

/**单击手势*/
@property (nonatomic, copy) tapCallBlock addTapGesture;



/**
 给View设置边框

 @param view 需要设置的View
 @param color g边框颜色
 @param borderWidth 边框大小
 @param borderType 边框的类型 枚举值
 */
- (void)borderForView:(UIView *)view
       borderForColor:(UIColor *)color
          borderWidth:(CGFloat)borderWidth
           borderType:(UIBorderSideType)borderType;


/**
 显示动画

 @param superView 蒙版图层
 @param subView 内容图层
 */
- (void)showAlertAnimationSuperView:(UIView *)superView
                            subView:(UIView *)subView;


/**
 隐藏动画

 @param superView 蒙版图层
 @param subView 内容图层
 */
- (void)dissAlertAnimationSuperView:(UIView *)superView
                            subView:(UIView *)subView;

/**
 额外添加一个初始化UI的方法
 */
- (void)setUI;
/**
 * 设置阴影
 */
-(void)setShadow:(UIColor *)color
   shadowOpacity:(CGFloat )shadowOpacity
    shadowRadius:(CGFloat )shadowRadius
    shadowOffset:(CGSize )shadowOffset;
@end

NS_ASSUME_NONNULL_END
