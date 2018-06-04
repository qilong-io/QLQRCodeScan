//
//  NSDate+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "NSDate+QLAdd.h"
#import "QLMacros.h"

@implementation NSDate (QLAdd)

- (NSDate *)zeroOfDate
{
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    NSInteger sourceGMTOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒数
    //    NSLog(@"offset = %zd",sourceGMTOffset/3600);///除以3600即可获取小时数，即为当前时区
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:self];
    
    NSString *zeroStr = [NSString stringWithFormat:@"%@ 00:00:00.000", strDate];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:sourceGMTOffset/3600]];
    NSDate *zeroDate = [dateFormatter2 dateFromString:zeroStr];
    
    QLog(@"first____%@", zeroDate);
    
    
    return zeroDate;
}

- (NSDate *)latestOfDate
{
    
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    NSInteger sourceGMTOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒数
    //    NSLog(@"offset = %zd",sourceGMTOffset/3600);///除以3600即可获取小时数，即为当前时区
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:self];
    
    NSString *zeroStr = [NSString stringWithFormat:@"%@ 23:59:59.000", strDate];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:sourceGMTOffset/3600]];
    NSDate *zeroDate = [dateFormatter2 dateFromString:zeroStr];
    
    QLog(@"last____%@", zeroDate);
    
    return zeroDate;
}

/**
 计算零时区时间戳（当日00:00:00，000）
 
 @return 时间戳
 */
- (NSTimeInterval)zeroOfInterval{
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    NSInteger sourceGMTOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒数
    //    当前时区时间戳
    NSTimeInterval interval = [[self zeroOfDate] timeIntervalSince1970];
    //    当前时区时间戳减去 时间间隔 得到 UTC 时间戳
    NSTimeInterval zeroInterval = interval - sourceGMTOffset;
    return zeroInterval;
}

/**
 零时区时间戳（当日23:59:59.000）
 
 @return 时间戳
 */
- (NSTimeInterval)latestOfInterval{
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    NSInteger sourceGMTOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒数
    //    当前时区时间戳
    NSTimeInterval interval = [[self latestOfDate] timeIntervalSince1970];
    //    当前时区时间戳减去 时间间隔 得到 UTC 时间戳
    NSTimeInterval lateInterval = interval - sourceGMTOffset;
    return lateInterval;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

@end
