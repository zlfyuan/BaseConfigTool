//
//  ZLFConstant.h
//  Pods-ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZLFTHEMECOLOR ZLFMYCOLOR(255,199,66)

#define TEXTCOLOR [[UIColor blackColor] colorWithAlphaComponent:0.6]

#define LINECOLOR ZLFMYCOLOR(228,227,237)
#define LINE2COLOR ZLFMYCOLOR(247,247,247)


#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define NavBarHeight 44.0

#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define navgationBarHeight (StatusBarHeight + NavBarHeight)

#define GETDEFAULT_IMAGE [UIImage imageNamed:@"defautle"]

#define GET_Format(string) [NSString stringWithFormat:@"%@",string]

#define ZLFLocalizedString(string) NSLocalizedString(string,nil)

#define GET_IMAGE(imageName) [UIImage imageNamed:imageName]

//+++++++++++++++++++++++++++++++++++++通用

#define ARCCOLOR [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.5];

#define ZLFMYCOLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]


#define Screen [UIScreen mainScreen].bounds
#define SWIDTH [UIScreen mainScreen].bounds.size.width
#define SHEIGHT [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define ZLFLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
// ZLFLog(fmt,...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

//NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZLFLog(...)
#endif


#define get_name(Cals)  unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([Cals  class], &count);\
for (int i = 0; i < count; i++) {\
Ivar ivar = ivars[i];\
NSLog(@"%@--->>%s", NSStringFromClass([Cals  class]),ivar_getName(ivar));\
}\
free(ivars);\


/**
 * iOS 11 之后 解决导航栏一进去要拖一下才会正常问题
 */
#define navigationBarOpacity if(@available(iOS 11.0, *)) {\
[self.navigationController.navigationBar setValue:[NSNumber numberWithBool:false] forKey:@"_backgroundOpacity"];}\

#define navigationBarOpacityTrue if(@available(iOS 11.0, *)) {\
[self.navigationController.navigationBar setValue:[NSNumber numberWithBool:true] forKey:@"_backgroundOpacity"];}\

#define textFieldresignFirstResponder -(BOOL)textFieldShouldReturn:(UITextField *)textField{\
[textField endEditing:YES];\
return YES;\
}\
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{\
if ([string isEqualToString:@"\n"]) {\
[textField resignFirstResponder];\
}\
return YES;\
}\

#define ZLFWarring__METHOD_ATTRIBUTE(contentString) __attribute__((unavailable(contentString)));

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)




NS_ASSUME_NONNULL_BEGIN

@interface ZLFConstant : NSObject

@end

NS_ASSUME_NONNULL_END
