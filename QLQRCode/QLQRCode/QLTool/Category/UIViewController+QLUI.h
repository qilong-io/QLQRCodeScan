//
//  UIViewController+QLUI.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, DCNavItemType) {
    
    DCNavItemLeft = 0,
    DCNavItemRight
};

@interface UIViewController (QLUI)

NS_ASSUME_NONNULL_BEGIN



/**
 Add a UIButton to navigationBarButtonItem
 
 @param navItemType left or right itemType
 @param button UIButton
 */
- (void)addNavItem:(DCNavItemType)navItemType item:(UIButton *)button;


/**
 Add a image of button to navigationBarButtonItem
 
 @param navItemType left or right itemType
 @param imageName the background image of the button
 */
- (void)addNavItem:(DCNavItemType)navItemType itemImageName:(NSString *)imageName;


/**
 Add title and titleColor of button to navigationBarButtonItem
 
 @param navItemType left or right itemType
 @param title titleString
 @param titleColor the title color
 */
- (void)addNavItem:(DCNavItemType)navItemType itemTitle:(NSString *)title titleColor:(UIColor *) titleColor;


- (void)addNavItem:(DCNavItemType)navItemType item1:(UIButton *)button1 item2:(UIButton *)button2;


- (void)addNavItem:(DCNavItemType)navItemType item1ImageName:(NSString *)imageName1 item2ImageName:(NSString *)imageName2;

- (void)leftNavItem1Touch;

- (void)leftNavItem2Touch;

- (void)rightNavItem1Touch:(UIButton *)button;

- (void)rightNavItem2Touch:(UIButton *)button;

/**
 NavigationBar leftButtonItem touchUpInside event
 
 You can implement it with [super leftNavItemTouch], when you want to pop viewController and do something
 
 */
- (void)leftNavItemTouch;


/**
 NavigationBar rightButtonItem touchUpInside event
 */
- (void)rightNavItemTouch:(UIButton *)button;


- (void)showHUDWithModelText:(NSString *)text offsetY:(CGFloat)offsetY;

- (void)showHUDWithBottomModelText:(NSString *)text;

- (void)showHUDWithCenterModelText:(NSString *)text;

- (void)showHUDWithCustomView:(UIView *)customView text:(NSString *)text;

- (void)showNOAutoHideHUDWithCustomView:(UIView *)customView text:(NSString *)text;


- (void)showHUDLoading;

- (void)hideHUDLoading;

- (void)showHUDLoading:(NSString *)info;

- (void)showHUDNetworkingError;


// 当前屏幕高清截图
- (UIImage *)captureCurrentView:(UIView *)view;

- (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;

NS_ASSUME_NONNULL_END

@end
