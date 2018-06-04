//
//  UIStoryboard+QLUI.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIStoryboard+QLUI.h"

@implementation UIStoryboard (QLUI)

+ (UIViewController *)storyboardWithName:(NSString *)storyboardName identifier:(NSString *)identifier {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:identifier];
    
}

@end
