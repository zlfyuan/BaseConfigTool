//
//  UIViewController+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/2.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

/**
 返回两个按钮的Alert

 @param title title description
 @param message message description
 @param comfirmTitle comfirmTitle按钮颜色
 @param comfirmTitleColor comfirmTitleColor description
 @param donTitle donTitle description
 @param donTitleColor donActionTitle按钮颜色
 @param confirmAction 确认事件回调
 @param donAction 退出或取消事件回调
 */
-(void)alertViewTitle:(NSString *__nullable)title
              message:(NSString *__nullable)message
     withConfirmTitle:(NSString *)comfirmTitle
        withConfirmTitleColor:(UIColor *__nullable)comfirmTitleColor
        withDonTitle:(NSString *)donTitle
         withDonTitleColor:(UIColor *__nullable)donTitleColor
              confirm:(void(^ __nullable)(UIAlertAction *confirmAction))confirmAction
                  don:(void(^ __nullable)(UIAlertAction *donAction))donAction{
    UIAlertController *coller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:comfirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmAction) {
            confirmAction(action);
        }
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:donTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (donAction) {
            donAction(action);
        }
    }];
    [action2 setValue:donTitleColor ? : [UIColor lightGrayColor] forKey:@"titleTextColor"];
    [action1 setValue:comfirmTitleColor ? : [UIColor blueColor] forKey:@"titleTextColor"];

    [coller addAction:action2];
    [coller addAction:action1];
    [self presentViewController:coller animated:YES completion:nil];
    
}

/**
 返回一个alertSheet

 @param title title description
 @param messages messages description
 @param titlesArr titlesArr 该参数不能为空
 @param titlesColor titlesColor titles按钮颜色
 @param donActionTitle donActionTitle 该参数不能为空
 @param donActionTitleColor donActionTitleColor donActionTitle按钮颜色
 @param confirmAction confirmAction 点击item事件回调
 @param donAction donAction 退出或取消事件回调
 */
-(void)alertSheetViewTitle:(NSString *__nullable)title
                  messages:(NSString *__nullable)messages
              actionsTitle:(NSArray *)titlesArr
              actionsTitleColor:(UIColor *__nullable)titlesColor
                 donAction:(NSString *)donActionTitle
                 donActionColor:(UIColor *__nullable)donActionTitleColor
                   confirm:(void(^ __nullable)(UIAlertAction *confirmAction))confirmAction
                       don:(void(^ __nullable)(UIAlertAction *donAction))donAction{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title  message:messages preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i=0; i<titlesArr.count; i++) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:titlesArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirmAction) {
                confirmAction(action);
            }
        }];
        [alert addAction:action1];
        [action1 setValue:titlesColor ? : [UIColor lightGrayColor] forKey:@"titleTextColor"];
    }
    UIAlertAction *actiondo = [UIAlertAction actionWithTitle:donActionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (donAction) {
            donAction(action);
        }
    }];
    [actiondo setValue:donActionTitleColor ? : [UIColor redColor] forKey:@"titleTextColor"];
    [alert addAction:actiondo];
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 返回一个自定义带一个按钮的alert
 
 @param title title description
 @param message message description
 @param actionTitle actionTitle 按钮标题
 @param actionTitleColor actionTitleColor 按钮颜色
 @param confirmAction confirmAction 按钮事件回调
 */
-(void)alertViewTitle:(NSString *__nullable)title
              message:(NSString *__nullable)message
          actionTitle:(NSString *__nullable)actionTitle
          actionTitleColor:(UIColor *__nullable)actionTitleColor
              confirm:(void(^ __nullable)(id confirmAction))confirmAction{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmAction) {
            confirmAction(action);
        }
    }];
    [action1 setValue:actionTitleColor ? : [UIColor blueColor] forKey:@"titleTextColor"];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
