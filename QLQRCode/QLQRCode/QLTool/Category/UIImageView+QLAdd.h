//
//  UIImageView+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (QLAdd)

/**
 Return a circle avatar
 
 @param url avatar URL string
 */
- (void)setCircleHeaderWithURLString:(NSString *)url;

@end
