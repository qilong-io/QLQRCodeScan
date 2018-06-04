//
//  NSString+QLConvert.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "NSString+QLConvert.h"

@implementation NSString (QLConvert)

- (NSData *)hex2data {
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < self.length / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}

- (NSData *)reverseHex2data {
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < self.length / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = ~strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}


+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}

- (NSString *)convertStringToHexStr {
    if (!self || [self length] == 0) {
        return @"";
    }
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

- (NSString *)getCheckStringSum {
    int length = (int)self.length/2;
    NSData *data = [self hexToBytes:self];
    Byte *bytes = (unsigned char *)[data bytes];
    
    int sum = 0;
    for (int i = 0; i<length; i++) {
        sum += bytes[i];
    }
    
    printf("校验和：%d\n",sum);
    
    NSString *str = [NSString stringWithFormat:@"%@",[self ToHex:sum]]; // c7
    return str;
}



- (NSData *)getCheckSum {
    int length = (int)self.length/2;
    NSData *data = [self hexToBytes:self];
    Byte *bytes = (unsigned char *)[data bytes];
    
    int sum = 0;
    for (int i = 0; i<length; i++) {
        sum += bytes[i];
    }
    
    //    printf("校验和：%d\n",sum);
    
    NSString *str = [NSString stringWithFormat:@"%@",[self ToHex:sum]]; // c7
    return [self hexToBytes:str];
}

- (NSData *)hexToBytes:(NSString *)str
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= str.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [str substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

- (NSString *)ToHex:(int)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    
    //处理位数不足的情况, 两个字节
    if(str.length == 1){
        str =  [NSString stringWithFormat:@"000%@",str];
    }else if (str.length == 2){
        str = [NSString stringWithFormat:@"00%@",str];
    }else if (str.length == 3) {
        str = [NSString stringWithFormat:@"0%@",str];
    }else {
        str = str;
    }
    
    
    NSString *lowStr = [str substringFromIndex:2]; // c7
    NSString *highStr = [str substringToIndex:2]; // 02
    
    return [NSString stringWithFormat:@"%@%@", lowStr, highStr]; // 低字节序
}


+ (NSString *)randomHexStr {
    
    NSString *nLetterValue;
    int x = arc4random() % 16;
    switch (x)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:
            nLetterValue = [NSString stringWithFormat:@"%u",x];
    }
    return [NSString stringWithFormat:@"0%@",nLetterValue];
}



- (NSString *)exclusiveOrRandomuserId:(NSString *)userId {
    
    NSData *radomData = [self hexToBytes:self];
    NSData *userIdData = [self hexToBytes:userId];
    
    NSMutableString *newString = [NSMutableString string];
    
    Byte *randomBytes = (Byte *)[radomData bytes];
    Byte *bytes = (Byte *)[userIdData bytes];
    int length = (int)userId.length/2;
    for (int i = 0; i<length; i++) {
        bytes[i] = bytes[i] ^ randomBytes[0];
        
        [newString appendString:[self decimalToHex:bytes[i]]];
    }
    return newString;
}


// 将十进制Int转化为16进制字符串
- (NSString *)decimalToHex:(int) tmpid {
    
    NSString *nLetterValue;
    NSString *str =@"";
    int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    return str;
}



- (NSString *)highLowReverse {
    
    NSString *temp1 = [self substringToIndex:2];
    NSString *temp2 = [self substringFromIndex:2];
    
    return [NSString stringWithFormat:@"%@%@", temp2, temp1];
}

- (int)stringWithSum {
    NSData *data = [self hex2data];
    int length = (int)self.length/2;
    Byte *bytes = (unsigned char *)[data bytes];
    
    int sum = 0;
    for (int i = 0; i<length; i++) {
        if (length == 2) {
            if (i == 0) {
                sum += bytes[i]*16*16;
            }
            if (i == 1) {
                sum += bytes[i];
            }
        }else if (length == 1) {
            sum += bytes[i];
        }
    }
    return sum;
}


- (NSString *)getBinaryByhex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [hexDic setObject:@"0000" forKey:@"0"];
    [hexDic setObject:@"0001" forKey:@"1"];
    [hexDic setObject:@"0010" forKey:@"2"];
    [hexDic setObject:@"0011" forKey:@"3"];
    [hexDic setObject:@"0100" forKey:@"4"];
    [hexDic setObject:@"0101" forKey:@"5"];
    [hexDic setObject:@"0110" forKey:@"6"];
    [hexDic setObject:@"0111" forKey:@"7"];
    [hexDic setObject:@"1000" forKey:@"8"];
    [hexDic setObject:@"1001" forKey:@"9"];
    [hexDic setObject:@"1010" forKey:@"a"];
    [hexDic setObject:@"1011" forKey:@"b"];
    [hexDic setObject:@"1100" forKey:@"c"];
    [hexDic setObject:@"1101" forKey:@"d"];
    [hexDic setObject:@"1110" forKey:@"e"];
    [hexDic setObject:@"1111" forKey:@"f"];
    
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[self length]; i++) {
        NSRange rage;
        rage.length = 1;
        rage.location = i;
        NSString *key = [self substringWithRange:rage];
        
        binaryString = (NSMutableString *)[NSString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
    }
    return binaryString;
}

- (NSString *)HexConvertToASCII {
    int j=0;
    NSMutableString *mulString = [NSMutableString string];
    for(int i=0;i<[self length];i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        unichar hex_char1 = [self characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        i++;
        unichar hex_char2 = [self characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        int_ch = int_ch1+int_ch2;
        NSString *str =[NSString stringWithUTF8String:(char *)&int_ch];
        
        if (str == nil) {
            continue;
        }
        
        [mulString appendString:str];
        j++;
    }
    return mulString;
}

- (NSString *)stringToASCII {
    NSMutableString *mulString = [NSMutableString string];
    for (int i = 0; i < self.length; i++) {
        
        int asciiCode = [self characterAtIndex:i];
        NSString *hex = [self OneIntToOneHex:asciiCode];
        [mulString appendString:hex];
    }
    return mulString;
}

- (NSString *)OneIntToOneHex:(uint16_t)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    return str;
}


- (NSString *)XORCheck {
    NSString *result = @"00";
    for (int i = 0; i < self.length; i = i+2) {
        NSString *temp = [[self substringWithRange:NSMakeRange(i,2)] uppercaseString];
        result = [NSString pinxCreator:temp withPinv:result];
    }
    return result;
}

+ (NSString *)pinxCreator:(NSString *)pan withPinv:(NSString *)pinv {
    if (pan.length != pinv.length)
    {
        return nil;
    }
    
    const char *panchar = [pan UTF8String];
    const char *pinvchar = [pinv UTF8String];
    
    NSString *temp = [[NSString alloc] init];
    
    for (int i = 0; i < pan.length; i++)
    {
        int panValue = [self charToint:panchar[i]];
        int pinvValue = [self charToint:pinvchar[i]];
        
        temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%X",panValue^pinvValue]];
    }
    return temp;
}

+ (int)charToint:(char)tempChar {
    if (tempChar >= '0' && tempChar <='9')
    {
        return tempChar - '0';
    }
    else if (tempChar >= 'A' && tempChar <= 'F')
    {
        return tempChar - 'A' + 10;
    }
    return 0;
}


+ (NSString *)getZoneHex {
    
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone] ;///获取当前时区信息
    int sourceGMTOffset = (int)[destinationTimeZone secondsFromGMTForDate:[NSDate date]];///获取偏移秒
    NSString *isEast;
    if (sourceGMTOffset >= 0) {
        isEast = @"0";
        sourceGMTOffset = sourceGMTOffset;
    }else {
        isEast = @"1";
        sourceGMTOffset = -sourceGMTOffset;
    }
    
    return [NSString stringWithFormat:@"%@%@",isEast, [@"12" decimalToHex:sourceGMTOffset/3600]];
}

- (NSString *)convertToTimeStr {
    
    int time = [self intValue];
    switch (time) {
        case 1:
            return @"1 min";
            break;
        case 5:
            return @"5 mins";
            break;
        case 10:
            return @"10 mins";
            break;
        case 15:
            return @"15 mins";
            break;
        case 30:
            return @"30 mins";
            break;
        case 60:
            return @"1 hour";
            break;
        case 120:
            return @"2 hours";
            break;
        case 240:
            return @"4 hours";
            break;
        case 480:
            return @"8 hours";
            break;
        case 720:
            return @"12 hours";
            break;
        case 1440:
            return @"24 hours";
            break;
        default:
            return @"--";
            break;
    }
}

@end
