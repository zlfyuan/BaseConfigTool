//
//  ZLFCenterPopView.m
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/25.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFCenterPopView.h"
#import "ZLFConstant.h"
@implementation ZLFCenterPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.whiteContainerViewHeight = SHEIGHT / 1.5;
        self.whiteContainerViewWidth = SWIDTH - 60;
        self.frame = Screen;
        [self addSubview:self.maskPopView];
        [self addSubview:self.whiteContainerView];
    }
    return self;
}

- (void)showPopViewToCurrentView:(UIView *)currentView showAfter:(finishedEvent)finishedEvent{
    if (!self.is_show) {
        [currentView addSubview:self];
        self.whiteContainerView.frame = CGRectMake((SWIDTH - self.whiteContainerViewWidth)/2, (SHEIGHT - self.whiteContainerViewHeight)/2, self.whiteContainerViewWidth, self.whiteContainerViewHeight);
        self.whiteContainerView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
        self.whiteContainerView.alpha = 0;
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0.9
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
                             self.whiteContainerView.transform = CGAffineTransformMakeScale(1, 1);
                             self.whiteContainerView.alpha = 1;
                         } completion:^(BOOL finished) {
                             
                         }];
    }
}

- (void)showPopViewAfter:(finishedEvent)finishedEvent{
    if (!self.is_show) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        self.whiteContainerView.frame = CGRectMake((SWIDTH - self.whiteContainerViewWidth)/2, (SHEIGHT - self.whiteContainerViewHeight)/2, self.whiteContainerViewWidth, self.whiteContainerViewHeight);
        self.whiteContainerView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
        self.whiteContainerView.alpha = 0;
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:0.8
              initialSpringVelocity:0.9
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
                             self.whiteContainerView.transform = CGAffineTransformMakeScale(1, 1);
                             self.whiteContainerView.alpha = 1;
                         } completion:^(BOOL finished) {
                             
                         }];
    }
}

- (void)dissPopViewAfter:(finishedEvent)finishedEvent{
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0;
        self.whiteContainerView.alpha = 0;
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
        _whiteContainerView.frame = CGRectMake((SWIDTH - self.whiteContainerViewWidth)/2, (SHEIGHT - self.whiteContainerViewHeight)/2, self.whiteContainerViewWidth, self.whiteContainerViewHeight);
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
