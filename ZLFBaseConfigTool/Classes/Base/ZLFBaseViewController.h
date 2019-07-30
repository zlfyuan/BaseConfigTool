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

- (void)useMethodToFindBlackLineAndHind;
- (void)push:(UIViewController *)viewController;
- (void)pop;
- (void)popRootViewController;

- (void)presentViewController:(UIViewController *)viewController;
- (void)disMiss;

- (void)addItemLeft:(id)content action:(SEL)action;
- (void)addItemRight:(id)content action:(SEL)action;
- (void)dispatch_after:(NSTimeInterval )time handleCommplate:(void(^)())Commplate;

- (void)loadNewData;
- (void)loadMoreData;
- (void)setUp;

/**block*/
@property (nonatomic, copy)void (^blockInfo)(id info);

/**id*/
@property (nonatomic, strong) id sendValue;

/**是否是第一次加载 */
@property (nonatomic,assign) BOOL isLoadController;
@end

NS_ASSUME_NONNULL_END
