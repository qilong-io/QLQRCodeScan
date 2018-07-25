//
//  NSString+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "NSString+QLAdd.h"
#import <UIKit/UIKit.h>
#import "NSData+QLAdd.h"
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation NSString (QLAdd)

- (NSString *)md5String {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] md5String] uppercaseString];
}

+ (NSString *)macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //    DLog(@"outString:%@", outstring);
    free(buf);
    return [outstring uppercaseString];
}

+ (NSString *)identifierForVendor
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return @"";
}

+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //    NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}



+ (BOOL)valiMobile:(NSString *)mobile {
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (mobile.length != 11)
    {
        return NO;
        
    }else{
        
        /**
         
         * 移动号段正则表达式
         
         */
        
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        
        /**
         
         * 联通号段正则表达式
         
         */
        
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        
        /**
         
         * 电信号段正则表达式
         
         */
        
        NSString *CT_NUM = @"^((133)|(153)|(17[3,7])|(18[0,1,9]))\\d{8}$";
        
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            
            return YES;
            
        }else{
            
            return NO;
        }
    }
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic {
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (BOOL) validateEmail:(NSString *)email {
    
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

+ (NSString*)getPreferredLanguage {
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    return preferredLang;
}


+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)convertTimeChuoToCanada:(NSString *)timeChuo {
    
    //    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    //    NSInteger sourceGMTOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒数
    //    NSLog(@"offset = %zd",sourceGMTOffset/3600);///除以3600即可获取小时数，即为当前时区
    NSTimeInterval time = [timeChuo doubleValue];
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:detaildate];
}

- (BOOL)isPureDigital {
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

/**
 *  判断字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return YES or NO
 */
+ (BOOL)judgeIsEmptyWithString:(NSString *)string {
    
    if ([string isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    
    if ([string isKindOfClass:[NSNull class]] || string.length == 0 || [string isEqualToString:@""] || string == nil || string == NULL || [string isEqual:[NSNull null]])
    {
        return YES;
    }
    return NO;
}

//判断是否全是空格
+ (BOOL) isEmpty:(NSString *)str {
    
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

@end
