//
//  NSData+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (QLAdd)

/**
 NSData 转 MD5 字符串
 
 @return NSString
 */
- (NSString *)md5String;

/**
 NSData 转 NSDictionary
 
 @return NSDictionary
 */
- (NSDictionary *)convertDict; // data -> json -> dict

@end
