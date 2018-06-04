//
//  UIImage+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QLAdd)

/**
 Get a circle image
 
 @return circle image
 */

/// 圆形图片
- (instancetype)circleImage;

/// 颜色转图片
+ (UIImage*)createImageWithColor:(UIColor*)color;

+ (UIImage*)imageFromView:(UIView*)view;

@end
