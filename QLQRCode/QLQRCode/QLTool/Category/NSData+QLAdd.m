//
//  NSData+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "NSData+QLAdd.h"
#include <CommonCrypto/CommonCrypto.h>
#include <zlib.h>
#import "QLMacros.h"

@implementation NSData (QLAdd)

- (NSString *)md5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSDictionary *)convertDict {
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        QLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
    
}

@end
