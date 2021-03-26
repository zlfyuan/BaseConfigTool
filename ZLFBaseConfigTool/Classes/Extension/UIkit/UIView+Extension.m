//
//  UIView+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/2.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>
@implementation UIView (Extension)

/* x的setter和getter方法 */
- (void)setZ_x:(CGFloat)z_x{
    CGRect frame = self.frame;
    frame.origin.x = z_x;
    self.frame = frame;
}
- (CGFloat)z_x{
    return self.frame.origin.x;
}

/* y的setter和getter方法 */
- (void)setZ_y:(CGFloat)z_y{
    CGRect frame = self.frame;
    frame.origin.y = z_y;
    self.frame = frame;
}
- (CGFloat)z_y{
    return self.frame.origin.y;
}

/* width的setter和getter方法 */
- (void)setZ_width:(CGFloat)z_width{
    CGRect frame = self.frame;
    frame.size.width = z_width;
    self.frame = frame;
}
- (CGFloat)z_width{
    return self.frame.size.width;
}

/* height的setter和getter方法 */
- (void)setZ_height:(CGFloat)z_height{
    CGRect frame = self.frame;
    frame.size.height = z_height;
    self.frame = frame;
}
- (CGFloat)z_height{
    return self.frame.size.height;
}

- (void)setZ_centerX:(CGFloat)z_centerX{
    CGPoint center = self.center;
    center.x = z_centerX;
    self.center = center;
}

- (CGFloat)z_centerX{
    return self.center.x;
}

- (void)setZ_centerY:(CGFloat)z_centerY{
    CGPoint center = self.center;
    center.y = z_centerY;
    self.center = center;
}

- (CGFloat)z_centerY{
    return self.center.y;
}


/* size的setter和getter方法 */
- (void)setZ_size:(CGSize)z_size{
    CGRect frame = self.frame;
    frame.size = z_size;
    self.frame = frame;
}
- (CGSize)z_size{
    return self.frame.size;
}

/* origin的setter和getter方法 */
- (void)setZ_origin:(CGPoint)z_origin{
    CGRect frame = self.frame;
    frame.origin = z_origin;
    self.frame = frame;
}
- (CGPoint)z_origin
{
    return self.frame.origin;
}

//MARK:  - 添加手势识别器
static void *gestureKey = &gestureKey;
- (void)setAddTapGesture:(tapCallBlock)addTapGesture {
    objc_setAssociatedObject(self, gestureKey, addTapGesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(tap:)];
    addTapGesture = self.addTapGesture;
    [self addGestureRecognizer:tap];
}
- (tapCallBlock)addTapGesture{
    return objc_getAssociatedObject(self, gestureKey);
}

- (void)tap:(UITapGestureRecognizer *)tap{
    if (self.addTapGesture) {
        self.addTapGesture(tap);
    }
}

//MARK:  - 边框设置
- (void)borderForView:(UIView *)view
       borderForColor:(UIColor *)color
          borderWidth:(CGFloat)borderWidth
           borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        view.layer.borderWidth = borderWidth;
        view.layer.borderColor = color.CGColor;
        
    }
    
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f)
                                                 toPoint:CGPointMake(0.0f,
                                                                     view.frame.size.height)
                                                   color:color
                                             borderWidth:borderWidth]];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [view.layer addSublayer:[self addLineOriginPoint:
                                 CGPointMake(self.frame.size.width, 0.0f)
                                                 toPoint:CGPointMake( view.frame.size.width,
                                                                     self.frame.size.height)
                                                   color:color
                                             borderWidth:borderWidth]];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [view.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f)
                                                 toPoint:CGPointMake(view.frame.size.width, 0.0f)
                                                   color:color
                                             borderWidth:borderWidth]];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [view.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, view.frame.size.height)
                                                 toPoint:CGPointMake( view.frame.size.width, view.frame.size.height)
                                                   color:color
                                             borderWidth:borderWidth]];
    }
    
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0
                             toPoint:(CGPoint)p1
                               color:(UIColor *)color
                         borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}

- (void)showAlertAnimationSuperView:(UIView *)superView
                            subView:(UIView *)subView {
    
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    [window addSubview:superView];
    
    subView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    subView.alpha = 0;
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.9
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         superView.backgroundColor = [UIColor colorWithRed:0.f
                                                                     green:0.f
                                                                      blue:0.f
                                                                     alpha:0.5f];
                         subView.transform = CGAffineTransformMakeScale(1, 1);
                         subView.alpha = 1;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}


- (void)dissAlertAnimationSuperView:(UIView *)superView
                            subView:(UIView *)subView {
    [UIView animateWithDuration:0.35 delay:0
                        options:UIViewAnimationOptionCurveEaseIn animations:^{
        subView.alpha = 0;
        superView.alpha = 0;
    } completion:^(BOOL finished) {
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        [self removeFromSuperview];
    }];
  
}

//设置阴影
-(void)setShadow:(UIColor *)color
   shadowOpacity:(CGFloat )shadowOpacity
    shadowRadius:(CGFloat )shadowRadius
    shadowOffset:(CGSize )shadowOffset {
    self.layer.shadowColor = [UIColor blackColor].CGColor;//阴影的颜色
    self.layer.shadowOpacity =shadowOpacity;//阴影的透明度
    self.layer.shadowRadius = shadowRadius;//阴影的圆角
    self.layer.shadowOffset = shadowOffset;//阴影的偏移量
}

- (void)setUI{};

@end
