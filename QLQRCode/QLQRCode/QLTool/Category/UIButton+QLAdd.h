//
//  UIButton+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QLAdd)

NS_ASSUME_NONNULL_BEGIN


/**
 create navgationBar button with image
 
 autoSize the button
 
 @param image the image of the button
 @return the navgationBar button
 */
- (UIButton *)initWithNavagtionBarButton:(UIImage *)image;


/**
 create navgationBar button with title and title color
 
 autoSize the button
 
 @param buttonTitle item title
 @param titleColor item text color
 @return the navgationBar button
 */
- (UIButton *)initWithNavagtionBarButtonTitle:(NSString *)buttonTitle titleColor:(UIColor *)titleColor;


NS_ASSUME_NONNULL_END

@end
