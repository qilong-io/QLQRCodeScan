//
//  UIAlertController+QLUI.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIAlertController+QLUI.h"

@implementation UIAlertController (QLUI)

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Submit" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        submitBlock();
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock cancelBlock:(cancelBlock)cancelBlock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Submit" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        submitBlock();
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        cancelBlock();
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithOKTitle:(NSString *)title message:(NSString *)message submitBlock:(submitBlock)submitBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Submit" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        submitBlock();
    }];
    [alertController addAction:okAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}





+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:nil];
    [alertController addAction:cancelAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController completion:(completedBlock)completedBlock
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:nil];
    [alertController addAction:cancelAction];
    
    [viewController presentViewController:alertController animated:YES completion:^{
        
        if (completedBlock) {
            completedBlock();
        }
    }];
}


+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController submitBlock:(submitBlock)submitBlock completion:(completedBlock)completedBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Submit" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        submitBlock();
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [viewController presentViewController:alertController animated:YES completion:^{
        if (completedBlock) {
            completedBlock();
        }
    }];
}

@end
