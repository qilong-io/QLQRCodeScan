//
//  UIViewController+QLUI.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIViewController+QLUI.h"
#import "UIButton+QLAdd.h"
#import "MBProgressHUD.h"
#import "QLMacros.h"
#import <objc/runtime.h>

static const CGFloat defaultHideDelayTime = 2.0f;
static const CGFloat bottomOffset = 150.0f;
static const CGFloat centerOffset = 30.0f;

@interface UIViewController ()

@property (nonatomic, strong) MBProgressHUD *hud;


@end

@implementation UIViewController (QLUI)

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addNavItem:(DCNavItemType)navItemType item:(UIButton *)button {
    
    if (navItemType == DCNavItemLeft) {
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        [button addTarget:self action:@selector(leftNavItemTouch) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (navItemType == DCNavItemRight) {
        
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        [button addTarget:self action:@selector(rightNavItemTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)addNavItem:(DCNavItemType)navItemType item1:(UIButton *)button1 item2:(UIButton *)button2 {
    
    if (navItemType == DCNavItemLeft) {
        
        self.navigationItem.leftBarButtonItems = nil;
        self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:button1], [[UIBarButtonItem alloc] initWithCustomView:button2]];
        [button1 addTarget:self action:@selector(leftNavItem1Touch) forControlEvents:UIControlEventTouchUpInside];
        [button2 addTarget:self action:@selector(leftNavItem2Touch) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (navItemType == DCNavItemRight) {
        
        self.navigationItem.rightBarButtonItems = nil;
        self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:button1], [[UIBarButtonItem alloc] initWithCustomView:button2]];
        [button1 addTarget:self action:@selector(rightNavItem1Touch:) forControlEvents:UIControlEventTouchUpInside];
        [button2 addTarget:self action:@selector(rightNavItem2Touch:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

- (void)addNavItem:(DCNavItemType)navItemType item1ImageName:(NSString *)imageName1 item2ImageName:(NSString *)imageName2 {
    
    UIButton *btn1 = [[UIButton alloc]initWithNavagtionBarButton:[UIImage imageNamed:imageName1]];
    UIButton *btn2 = [[UIButton alloc]initWithNavagtionBarButton:[UIImage imageNamed:imageName2]];
    
    [self addNavItem:navItemType item1:btn1 item2:btn2];
}




- (void)addNavItem:(DCNavItemType)navItemType itemImageName:(NSString *)imageName {
    
    UIButton *btn = [[UIButton alloc] initWithNavagtionBarButton:[UIImage imageNamed:imageName]];
    [self addNavItem:navItemType item:btn];
}

- (void)addNavItem:(DCNavItemType)navItemType itemTitle:(NSString *)title titleColor: (UIColor *) titleColor {
    
    UIButton *btn = [[UIButton alloc] initWithNavagtionBarButtonTitle:title titleColor:titleColor];
    [self addNavItem:navItemType item:btn];
}

- (void)leftNavItemTouch {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightNavItemTouch:(UIButton *)button {}

- (void)leftNavItem1Touch {}

- (void)leftNavItem2Touch {}

- (void)rightNavItem1Touch:(UIButton *)button {}

- (void)rightNavItem2Touch:(UIButton *)button {}


- (void)showHUDWithModelText:(NSString *)text offsetY:(CGFloat)offsetY {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kApplication.windows[0] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    hud.margin = 10;
    [hud setOffset:CGPointMake(hud.offset.x, offsetY)];
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hideAnimated:YES afterDelay:defaultHideDelayTime];
}

- (void)showHUDWithBottomModelText:(NSString *)text {
    [self showHUDWithModelText:text offsetY:bottomOffset];
}

- (void)showHUDWithCenterModelText:(NSString *)text {
    [self showHUDWithModelText:text offsetY:centerOffset];
}

- (void)showHUDWithCustomView:(UIView *)customView text:(NSString *)text {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kApplication.windows[0] animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    
    hud.label.textColor = [UIColor darkTextColor];
    hud.label.text = text;
    hud.customView = customView;
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont boldSystemFontOfSize:17];
    hud.margin = 10.f;
    
    [hud hideAnimated:YES afterDelay:1.7f];
    
}

- (void)showNOAutoHideHUDWithCustomView:(UIView *)customView text:(NSString *)text {
    
    if (!self.hud) {
        self.hud = [MBProgressHUD showHUDAddedTo:kApplication.windows[0] animated:YES];
        self.hud.mode = MBProgressHUDModeCustomView;
        self.hud.label.text = text;
        self.hud.customView = customView;
    }else {
        self.hud.hidden = NO;
    }
}

- (void)showHUDLoading {
    
    if (!self.hud) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kApplication.windows[0] animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        self.hud = hud;
        hud.label.text = @"loading...";
    }else {
        self.hud.hidden = NO;
    }
}

- (void)showHUDLoading:(NSString *)info {
    if (!self.hud) {
        self.hud = [MBProgressHUD showHUDAddedTo:kApplication.windows[0] animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.label.text = info;
    }else {
        self.hud.hidden = NO;
    }
}

- (void)hideHUDLoading {
    
    if (self.hud) {
        self.hud.hidden = YES;
    }
}

- (void)showHUDNetworkingError {
    
    if (self.hud) {
        self.hud.hidden = YES;
    }
    [self showHUDWithBottomModelText:@"Server connection failed"];
}

- (UIImage *)captureCurrentView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);//原图
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:contextRef];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated {
    NSUInteger count = self.navigationController.viewControllers.count;
    if(self){
        if(self.navigationController) {
            if (count > times){
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:count-1-times] animated:animated];
            }else { // 如果times大于控制器的数量
                NSAssert(0, @"确定可以pop掉那么多控制器?");
            }
        }
    }
}

@end
