//
//  NSDate+Extension.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2021/3/8.
//  Copyright © 2021 1553427003@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)

- (NSInteger )year;

- (NSInteger )month;

- (NSInteger )day;

- (NSInteger )hour;

- (NSInteger )minute;

- (NSInteger )second;

/// 是否为今天
- (BOOL)isToday;

/// 是否为昨天
- (BOOL)isYesterday;

/// 是否为今年
- (BOOL)isThisYear;

/// 解析时间 格式化 date
/// @param formater 默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return 时间格式字符串
- (NSString *)parsingFormater:(NSString *__nullable)formater;

/// 解析时间
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @param time 秒
/// @return 字符串"yyyy-MM-dd HH:mm:ss"
+ (NSString *)parsingTimeFormater:(NSString *)formater time:(NSInteger )time;

/// 时间戳 转换 时间字符串
/// @param timeStamp 时间戳
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return 时间字符串
+ (NSString *)dateStringWithTimeStamp:(NSTimeInterval )timeStamp
                             formater:(NSString *__nullable)formater;

/// 时间字符串 转换成 时间戳
/// @param timeStr 时间字符串
/// @param timeStrFormater 类似 “yyyy-MM-dd HH:mm:ss”
/// @return 时间戳 NSTimeInterval
+ (NSTimeInterval )dateTimestampWithDateStr:(NSString *__nonnull)timeStr
                            timeStrFormater:(NSString *__nonnull)timeStrFormater;

/// 解析时间 格式化时间字符串 返回 date
/// @param timeStr 时间格式的字符串  ”2020-09-10-20-13“.....
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return NSDate
+ (NSDate *)initDateParsingTimeStr:(NSString *)timeStr
                          formater:(NSString *__nullable)formater;

/// 比较两个日期之间 某年或某月或某日或某时或某分或某秒 的具体差值
/// @param date date description
/// @param anotherDate anotherDate description
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @param type 需要比较的类型 年 月 日 时 分 秒
/// @Return 年 | 月 | 日 | 时 | 分 | 秒
+ (NSInteger )compareWithDate:(NSDate*)date
                     withDate:(NSDate*)anotherDate
                     formater:(NSString *__nullable)formater
                         type:(NSCalendarUnit )type;

@end

NS_ASSUME_NONNULL_END
