//
//  UIButton+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIButton+QLAdd.h"
#import "QLMacros.h"

static const CGFloat NavButtonMinHeight = 40.0f;
static const CGFloat NavButtonMinWidth = 40.0f;

static const CGFloat NavBarButtonFontSize = 16.0f;

QLSYNTH_DUMMY_CLASS(UIButton_DCAdd)

@implementation UIButton (QLAdd)

- (UIButton *) initWithNavagtionBarButton:(UIImage *)image {
    CGRect btnFrame = CGRectZero;
    
    btnFrame = CGRectMake(0, 0, image.size.width, NavButtonMinHeight);
    
    if (image.size.height < NavButtonMinHeight) {
        btnFrame.size.height = NavButtonMinHeight;
    }
    
    if (image.size.width < NavButtonMinWidth) {
        btnFrame.size.width = NavButtonMinHeight;
    }
    
    self = [self initWithFrame:btnFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    [self setImage:image forState:UIControlStateNormal];
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}


- (UIButton *)initWithNavagtionBarButtonTitle:(NSString *)buttonTitle titleColor:(UIColor *)titleColor {
    CGRect btnFrame = CGRectZero;
    
    CGSize btnSize = [buttonTitle boundingRectWithSize:CGSizeMake(Screen_Width, NavgationBarHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:NavBarButtonFontSize]} context:nil].size;
    
    btnFrame.size = CGSizeMake(btnSize.width, NavgationBarHeight);
    
    self = [self initWithFrame:btnFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    [self setTitle:buttonTitle forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:NavBarButtonFontSize];
    
    return self;
}

@end
