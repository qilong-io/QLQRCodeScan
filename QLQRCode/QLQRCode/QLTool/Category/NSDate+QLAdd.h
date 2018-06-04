//
//  NSDate+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (QLAdd)

///当天最初的时刻
- (NSDate *)zeroOfDate;
///当天最后的时刻
- (NSDate *)latestOfDate;

///当天最初的时刻时间戳
- (NSTimeInterval)zeroOfInterval;
///当天最后的时刻时间戳
- (NSTimeInterval)latestOfInterval;

// 增加多少小时
- (NSDate *)dateByAddingHours:(NSInteger)hours;

@end
