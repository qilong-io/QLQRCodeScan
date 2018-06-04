//
//  UIImageView+QLAdd.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIImageView+QLAdd.h"
//#import "UIImageView+WebCache.h"
#import "UIImage+QLAdd.h"
#import "QLMacros.h"

#define defaultPlaceHolderImage @"img_nan"

@implementation UIImageView (QLAdd)

- (void)setCircleHeaderWithURLString:(NSString *)url
{
    QLWeakSelf;
    UIImage *placeholder = [[UIImage imageNamed:defaultPlaceHolderImage] circleImage];
    QLog(@"导入SDWebImage方可使用");
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
//     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//         if (image == nil) return;
//         weakSelf.image = [image circleImage];
//     }];
}

@end
