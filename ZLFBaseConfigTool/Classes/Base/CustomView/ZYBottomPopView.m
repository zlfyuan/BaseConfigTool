//
//  ZYBottomPopView.m
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/4/4.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZYBottomPopView.h"
#import "ZLFConstant.h"
@implementation ZYBottomPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.whiteContainerViewHeight = SHEIGHT / 1.5;
        self.frame = Screen;
        [self addSubview:self.maskPopView];
        [self addSubview:self.whiteContainerView];
    }
    return self;
}

- (void)showPopViewToCurrentView:(UIView *)currentView showAfter:(finishedEvent)finishedEvent{
    if (!self.is_show) {
        [currentView addSubview:self];
        [UIView animateWithDuration:0.25
                         animations:^{
                             self.maskPopView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
                             self.whiteContainerView.frame = CGRectMake(0, SHEIGHT - self.whiteContainerViewHeight, SWIDTH, self.whiteContainerViewHeight);
                         } completion:^(BOOL finished) {
                             self.isShow = YES;
                             if (finishedEvent) {
                                 finishedEvent(self);
                             }
                         }];
    }
}

- (void)showPopViewAfter:(finishedEvent)finishedEvent{
    if (!self.is_show) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        [UIView animateWithDuration:0.25
                         animations:^{
                             self.maskPopView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
                             self.whiteContainerView.frame = CGRectMake(0, SHEIGHT - self.whiteContainerViewHeight, SWIDTH, self.whiteContainerViewHeight);
                         } completion:^(BOOL finished) {
                             self.isShow = YES;
                             if (finishedEvent) {
                                 finishedEvent(self);
                             }
                         }];
    }
}

- (void)dissPopViewAfter:(finishedEvent)finishedEvent{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.maskPopView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.f];
                         self.whiteContainerView.frame = CGRectMake(0, SHEIGHT, SWIDTH, self.whiteContainerViewHeight);
                     } completion:^(BOOL finished) {
                         if (finishedEvent) {
                             finishedEvent(self);
                         }
                         self.isShow = NO;
                         [self removeFromSuperview];
                     }];
}

- (UIView *)whiteContainerView{
    if (!_whiteContainerView) {
        _whiteContainerView = [UIView new];
        _whiteContainerView.frame = CGRectMake(0, SHEIGHT, SWIDTH, self.whiteContainerViewHeight);
        _whiteContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _whiteContainerView;
}

- (UIView *)maskPopView{
    if (!_maskPopView) {
        _maskPopView = [UIView new];
        _maskPopView.frame = Screen;
        _maskPopView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [_maskPopView addGestureRecognizer:tap];
    }
    return _maskPopView;
}

- (void)tap:(UITapGestureRecognizer *)tap{
    [self dissPopViewAfter:nil];
}

- (void)dealloc{
    NSLog(@"%@ 我被吃掉了",self);
}

@end
