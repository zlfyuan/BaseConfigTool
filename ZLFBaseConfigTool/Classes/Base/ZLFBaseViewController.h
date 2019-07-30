//
//  ZLFBaseViewController.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLFBaseViewController : UIViewController<UITextFieldDelegate>

/**
 隐藏导航栏的黑线
 */
- (void)useMethodToFindBlackLineAndHind;

/**
 控制器跳转

 @param viewController 要跳转的目标控制器
 */
- (void)push:(UIViewController *)viewController;
- (void)pop;
- (void)popRootViewController;
- (void)presentViewController:(UIViewController *)viewController;
- (void)disMiss;

/**
 添加导航按钮

 @param content 可以是title 可以image
 @param action 按钮动作
 */
- (void)addItemLeft:(id)content action:(SEL)action;
- (void)addItemRight:(id)content action:(SEL)action;

/**
 默认公开反方法
 */
- (void)loadNewData;
- (void)loadMoreData;
- (void)setUI;

/**block*/
@property (nonatomic, copy)void (^blockInfo)(id info);

/**页面传值*/
@property (nonatomic, strong) id sendValue;

/**是否是第一次加载 */
@property (nonatomic,assign) BOOL isLoadController;
@end

NS_ASSUME_NONNULL_END
