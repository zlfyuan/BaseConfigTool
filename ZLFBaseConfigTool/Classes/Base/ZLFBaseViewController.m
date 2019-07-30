//
//  ZLFBaseViewController.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFBaseViewController.h"

@interface ZLFBaseViewController ()

@end

@implementation ZLFBaseViewController

//MARK:  - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.isLoadController = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.isLoadController = NO;
}

// MARK: 隐藏系统导航栏底部的黑线
-(void)useMethodToFindBlackLineAndHind {
    UIImageView *blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = YES;
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

//MARK:  -  往导航里添加按钮
- (void)addItemLeft:(id)content action:(SEL)action{
    if ([content isKindOfClass:[UIImage class]]) {
        self.navigationItem.leftBarButtonItem = ({
            UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:content style:UIBarButtonItemStylePlain target:self action:action];
            item;
        });
    }else{
        self.navigationItem.leftBarButtonItem = ({
            UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:content style:UIBarButtonItemStylePlain target:self action:action];
            item;
        });
    }
    
}


- (void)addItemRight:(id)content action:(SEL)action{
    if ([content isKindOfClass:[UIImage class]]) {
        self.navigationItem.rightBarButtonItem = ({
            UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:content style:UIBarButtonItemStylePlain target:self action:action];
            item;
        });
    }else{
        self.navigationItem.rightBarButtonItem = ({
            UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:content style:UIBarButtonItemStylePlain target:self action:action];
            item.tintColor = [UIColor blackColor];
            item;
        });
    }
    
}

//MARK:  - 控制器跳转
- (void)push:(UIViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popRootViewController{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)presentViewController:(UIViewController *)viewController{
    
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

- (void)disMiss{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

//MARK:  UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//MARK:  - 公共方法
- (void)setUp{}
- (void)loadNewData{}
- (void)loadMoreData{}

- (void)dealloc{
    NSLog(@"%@",[self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
