//
//  ZLFImageButton.m
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFImageButton.h"

@implementation ZLFImageButton

#pragma mark - 实例化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        self.Space=5;
    }
    return self;
}


#pragma mark - 强制布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置自适应
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];
    
    switch (self.BtnStyle) {
        case ZYBtnStyleImageUp:
            [self layoutSubviewsWithUPview:self.imageView DownView:self.titleLabel];
            break;
        case ZYBtnStyleImageDown:
            [self layoutSubviewsWithUPview:self.titleLabel DownView:self.imageView];
            break;
        case ZYBtnStyleImageLeft:{
            [self layoutSubviewsWithLeftView:self.imageView RightView:self.titleLabel];
        }
            break;
        case ZYBtnStyleImageRight:
            [self layoutSubviewsWithLeftView:self.titleLabel RightView:self.imageView];
            break;
            
        default:
            break;
    }
    switch (self.contentStyle) {
        case ZYBtnContentStyleRight:
            [self layoutSubviewsContentWithLeftView:self.titleLabel RightView:self.imageView];
            break;
        case ZYBtnContentStyleLeft:
            [self layoutSubviewsContentWithLeftView:self.imageView RightView:self.titleLabel];
            break;
        case ZYBtnContentStyleNone:
            break;
        default:
            break;
    }
}

#pragma mark - 内容样式
- (void)layoutSubviewsContentWithLeftView:(UIView *)LeftView RightView:(UIView *)RightView{
    CGRect LeftViewFrame=LeftView.frame;
    CGRect RightViewFrame=RightView.frame;
    //总宽度CGRectGetWidth（获取宽度）
//    CGFloat totalWidth=CGRectGetWidth(LeftViewFrame)+self.Space+CGRectGetWidth(RightViewFrame);
    //获取左边view的X值
    LeftViewFrame.origin.x=0;
    //获取左边view的Y值
    LeftViewFrame.origin.y=(CGRectGetHeight(self.frame)-CGRectGetHeight(LeftViewFrame))/2.0;
    LeftView.frame=LeftViewFrame;
    //获取右边view的X值==左边view的X值加上间距
    RightViewFrame.origin.x=CGRectGetMaxX(LeftViewFrame)+self.Space;
    if ([RightView isKindOfClass:[UILabel class]]) {
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        RightViewFrame.size.width = self.frame.size.width - RightViewFrame.origin.x;
    }
    //获取右边view的Y值
    RightViewFrame.origin.y=(CGRectGetHeight(self.frame)-CGRectGetHeight(RightViewFrame))/2.0;
    RightView.frame=RightViewFrame;
}

#pragma mark - 居左居右强制布局
- (void)layoutSubviewsWithLeftView:(UIView *)LeftView RightView:(UIView *)RightView
{
    CGRect LeftViewFrame=LeftView.frame;
    CGRect RightViewFrame=RightView.frame;
    //总宽度CGRectGetWidth（获取宽度）
    CGFloat totalWidth=CGRectGetWidth(LeftViewFrame)+self.Space+CGRectGetWidth(RightViewFrame);
    //获取左边view的X值
    LeftViewFrame.origin.x=(CGRectGetWidth(self.frame)-totalWidth)/2.0;
    //获取左边view的Y值
    LeftViewFrame.origin.y=(CGRectGetHeight(self.frame)-CGRectGetHeight(LeftViewFrame))/2.0;
    LeftView.frame=LeftViewFrame;
    //获取右边view的X值==左边view的X值加上间距
    RightViewFrame.origin.x=CGRectGetMaxX(LeftViewFrame)+self.Space;
    //获取右边view的Y值
    RightViewFrame.origin.y=(CGRectGetHeight(self.frame)-CGRectGetHeight(RightViewFrame))/2.0;
    RightView.frame=RightViewFrame;
}

#pragma mark - 居上居下强制布局
- (void)layoutSubviewsWithUPview:(UIView *)Upview DownView:(UIView *)DownView
{
    CGRect upViewFrame=Upview.frame;
    CGRect downViewFrame=DownView.frame;
    CGFloat totalHeight=CGRectGetHeight(upViewFrame)+self.Space+CGRectGetHeight(downViewFrame);
    //获取上边view的X值
    upViewFrame.origin.x=(CGRectGetWidth(self.frame)-CGRectGetWidth(upViewFrame))/2.0;
    //获取上边的Y值
    upViewFrame.origin.y=(CGRectGetHeight(self.frame)-totalHeight)/2.0;
    
    Upview.frame=upViewFrame;
    
    //获取下边的view值
    downViewFrame.origin.x=(CGRectGetWidth(self.frame)-CGRectGetWidth(downViewFrame))/2.0;
    //获取Y值
    downViewFrame.origin.y=CGRectGetMaxY(upViewFrame)+self.Space;
    DownView.frame=downViewFrame;
}

@end

