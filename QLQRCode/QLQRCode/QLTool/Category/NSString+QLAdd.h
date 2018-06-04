//
//  NSString+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QLAdd)

/**
 Returns a lowercase NSString for md5 hash.
 
 @return 32 uppercase string
 */
///md5 string
- (NSString *)md5String;

///mac地址
+ (NSString *)macaddress;

///唯一标示
+ (NSString *)identifierForVendor;


/// 中文转拼音，转化的时候有点问题
+ (NSString *)transform:(NSString *)chinese;

/// 判断手机号码是否正确
+ (BOOL)valiMobile:(NSString *)mobile;

/// 字典转json 字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/// 验证邮箱
+ (BOOL)validateEmail:(NSString *)email;

///获取系统语言
+ (NSString*)getPreferredLanguage;

///获取日期时间yyyy/MM/dd
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

// 将时间戳转换为加拿大的时间
+ (NSString *)convertTimeChuoToCanada:(NSString *)timeChuo;

// 判断是不是纯数字
- (BOOL)isPureDigital;

/**
 *  判断字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return YES or NO
 */
+ (BOOL)judgeIsEmptyWithString:(NSString *)string;

/**
 判断是否全是空格
 
 @param str string 字符串
 @return YES or NO
 */
+ (BOOL)isEmpty:(NSString *)str;

@end
