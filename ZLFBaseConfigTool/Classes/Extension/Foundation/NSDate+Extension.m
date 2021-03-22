//
//  NSDate+Extension.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2021/3/8.
//  Copyright © 2021 1553427003@qq.com. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

#define force_inline __inline__ __attribute__((always_inline))

static force_inline NSDateComponents *dateComponets(NSDate *date,NSCalendarUnit component){
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:component fromDate:date];
    return components;
}

+ (NSString *)defaultFormater{
    return @"yyyy-MM-dd HH:mm:ss";
}

- (NSInteger )year{
    return dateComponets(self,NSCalendarUnitYear).year;
}

- (NSInteger )month{
    return dateComponets(self,NSCalendarUnitYear).month;
}

- (NSInteger )day{
    return dateComponets(self,NSCalendarUnitYear).day;
}

- (NSInteger )hour{
    return dateComponets(self,NSCalendarUnitYear).hour;
}

- (NSInteger )minute{
    return dateComponets(self,NSCalendarUnitYear).minute;
}

- (NSInteger )second{
    return dateComponets(self,NSCalendarUnitYear).second;
}

/// 解析时间 默认为Asia/Beijing 时区 格式化 date
/// @param formater 默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return 时间格式字符串
- (NSString *)parsingFormater:(NSString *__nullable)formater{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:formater ? : [NSDate defaultFormater]];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}

/// 解析时间
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @param time 秒
/// @return 字符串"yyyy-MM-dd HH:mm:ss"
+ (NSString *)parsingTimeFormater:(NSString *)formater time:(NSInteger )time{
    return @"未实现";
}

/// 时间戳 转换 时间字符串
/// @param timeStamp 时间戳
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return 时间字符串
+ (NSString *)dateStringWithTimeStamp:(NSTimeInterval )timeStamp formater:(NSString *__nullable)formater{
    // 时间戳timeStamp如果是精确到毫秒要/1000
    NSTimeInterval time = timeStamp;
    if (@(timeStamp).stringValue.length == 13) {
        time = timeStamp/1000;
    }
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formater ? : [NSDate defaultFormater]];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}

/// 时间字符串 转换成 时间戳
/// @param timeStr 时间字符串
/// @param timeStrFormater 类似 “yyyy-MM-dd HH:mm:ss”
/// @return 时间戳 NSTimeInterval
+ (NSTimeInterval )dateTimestampWithDateStr:(NSString *__nonnull)timeStr timeStrFormater:(NSString *__nonnull)timeStrFormater{
    NSDate *date = [NSDate initDateParsingTimeStr:timeStr formater:timeStrFormater];
    // 字符串转成时间戳,精确到毫秒*1000
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]*1000];
    return [timeStamp integerValue];
}

/// 解析时间 默认为Asia/Beijing 时区 格式化 date
/// @param timeStr 时间格式的字符串  ”2020-09-10-20-13“.....
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @return NSDate
+ (NSDate *)initDateParsingTimeStr:(NSString *)timeStr formater:(NSString *__nullable)formater{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:formater ? : [NSDate defaultFormater]];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    NSDate *date = [formatter dateFromString:timeStr];
    return date;
}

/// 比较两个日期之间 某年或某月或某日或某时或某分或某秒 的具体差值
/// @param date date description
/// @param anotherDate anotherDate description
/// @param formater  默认样式 “yyyy-MM-dd HH:mm:ss”
/// @param type 需要比较的类型 年 月 日 时 分 秒
/// @Return 年 | 月 | 日 | 时 | 分 | 秒
+ (NSInteger )compareWithDate:(NSDate*)date withDate:(NSDate*)anotherDate formater:(NSString *__nullable)formater type:(NSCalendarUnit )type{
    
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //年、月、日、时、分、秒、周等等都可以
    NSUInteger unitFlags = type;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date toDate:anotherDate options:NSCalendarWrapComponents];
    NSInteger typeValue = 0;
    switch (type) {
        case NSCalendarUnitYear:
            typeValue = [comps year];
            break;
        case NSCalendarUnitMonth:
            typeValue = [comps month];
            break;
        case NSCalendarUnitDay:
            typeValue = [comps day];
            break;
        case NSCalendarUnitHour:
            typeValue = [comps hour];
            break;
        case NSCalendarUnitMinute:
            typeValue = [comps minute];
            break;
        case NSCalendarUnitSecond:
            typeValue = [comps second];
        default:
            break;
    }
    //时间差
    return typeValue;
}

@end
