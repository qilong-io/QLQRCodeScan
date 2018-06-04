//
//  UINavigationBar+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (QLAdd)

/**
Change the pure color of the navgationBar

@param backgroundColor the color
*/
- (void)setBackgroundColor:(UIColor *)backgroundColor;


- (void)setBackgroundView:(UIView *)view;

@end
