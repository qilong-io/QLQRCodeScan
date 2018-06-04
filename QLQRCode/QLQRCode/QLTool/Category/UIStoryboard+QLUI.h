//
//  UIStoryboard+QLUI.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (QLUI)

+ (UIViewController *)storyboardWithName:(NSString *)storyboardName identifier:(NSString *)identifier;

@end
