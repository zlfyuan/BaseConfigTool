//
//  ZLFNavigationViewController.m
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFNavigationViewController.h"

@interface ZLFNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation ZLFNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.shadowImage = [UIImage new];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:20]}];
    [self.navigationBar setTintColor:[UIColor blackColor]];
    
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

/**
 * 当导航控制器的子控制器需要设置状态栏的时候需调用重写此方法
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if (![[super topViewController] isKindOfClass:[viewController class]]) {
        [super pushViewController:viewController animated:animated];
    }
    /**
     * 解决push的时候tabbar的往上碰的问题
     */
    // 修改tabBra的frame
//    if (IS_IPHONE_X) {
//
//        CGRect frame = self.tabBarController.tabBar.frame;
//        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
//        self.tabBarController.tabBar.frame = frame;
//    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}
@end
