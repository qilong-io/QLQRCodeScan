//
//  NSDictionary+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QLAdd)

/// 字典转json
/**
 NSDictionary 转 json 字符串
 
 @return NSString json 字符串
 */
- (NSString *)convertToJsonData;

@end
