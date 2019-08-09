//
//  ZYBottomPopView.h
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/4.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^finishedEvent)(id object);
@interface ZYBottomPopView : UIView

/**maskPopView*/
@property (nonatomic, strong) UIView *maskPopView;

/**whiteContainerView*/
@property (nonatomic, strong) UIView *whiteContainerView;

/**callBlock*/
@property (nonatomic, copy) finishedEvent finishedCallBlock;

/**whiteContainerViewHeight*/
@property (nonatomic, assign) CGFloat whiteContainerViewHeight;

/**是否展示*/
@property (nonatomic, assign,getter=is_show) BOOL isShow;

/**
 展示

 @param finishedEvent 展示之后的一个回调
 */
- (void)showPopViewAfter:(nullable finishedEvent)finishedEvent;

/**
 展示

 @param currentView 展示到指定的View
 @param finishedEvent 展示之后的一个回调
 */
- (void)showPopViewToCurrentView:(UIView *)currentView showAfter:(finishedEvent)finishedEvent;
/**
 消失
 
 @param finishedEvent 消失之后的一个回调
 */
- (void)dissPopViewAfter:(nullable finishedEvent)finishedEvent;


-(instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("the method noable，only use init")));

@end

NS_ASSUME_NONNULL_END
