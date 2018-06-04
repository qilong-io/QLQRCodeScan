//
//  NSString+QLConvert.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QLConvert)

/// 字符串16进制转NSData
- (NSData *)hex2data;

/// 字符串16进制反转成NSData
- (NSData *)reverseHex2data;

/// NSData转换成字符串16进制
+ (NSString *)convertDataToHexStr:(NSData *)data;

/// 将普通字符串转换为16进制字符串
- (NSString *)convertStringToHexStr;

/// 累加凑4个字节,做低字节序
- (NSData *)getCheckSum;

/// 生成一个随机的16进制字符串,一个字节
+ (NSString *)randomHexStr;

/// 十六进制随机数与或十六进制字符串
- (NSString *)exclusiveOrRandomuserId:(NSString *)userId;

/// 四位字符串, 截取前两位放后面,后两位放前面
- (NSString *)highLowReverse;

/// 4位16进制字符串累加  4d2f --->>> 19759
- (int)stringWithSum;

// 十六进制转二进制字符串
- (NSString *)getBinaryByhex;

// 十六进制字符串通过ASCII码转化成对应的字符串 52594F4249205041434B --->>> RYOBI PACK
- (NSString *)HexConvertToASCII;

// 有意义的字符串通过ASCII转化成对应的十六进制
- (NSString *)stringToASCII;

// 将所有的十六进制位累加起来
- (NSString *)getCheckStringSum;

/// 将十进制Int转化为16进制字符串
- (NSString *)decimalToHex:(int) tmpid;

/// 异或校验
- (NSString *)XORCheck;

/// 获取零时区
+ (NSString *)getZoneHex;

/// 120 -> 2 hours
- (NSString *)convertToTimeStr;

@end
