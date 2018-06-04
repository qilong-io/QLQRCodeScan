//
//  UIDevice+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIDevice+QLAdd.h"
#import "QLMacros.h"

QLSYNTH_DUMMY_CLASS(UIDevice_DCAdd)
@implementation UIDevice (QLAdd)

+ (double)systemVersion {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

@end
