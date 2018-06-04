//
//  UIAlertController+QLUI.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^submitBlock)(void);
typedef void (^completedBlock)(void);
typedef void (^cancelBlock)(void);

@interface UIAlertController (QLUI)


+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock;


+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController completion:(completedBlock)completedBlock;

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController submitBlock:(submitBlock)submitBlock completion:(completedBlock)completedBlock;

+ (void)showAlertWithOKTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock;

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock cancelBlock:(cancelBlock)cancelBlock;


@end
