//
//  UIDevice+QLAdd.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (QLAdd)

NS_ASSUME_NONNULL_BEGIN

+ (double)systemVersion;

NS_ASSUME_NONNULL_END

#ifndef dcSystemVersion
#define dcystemVersion  [UIDevice systemVersion]
#endif

#ifndef iOS7_OR_Later
#define iOS7_OR_Later (dcystemVersion >= 7)
#endif

#ifndef iOS8_OR_Later
#define iOS8_OR_Later (dcystemVersion >= 8)
#endif

#ifndef iOS9_OR_Later
#define iOS9_OR_Later (dcystemVersion >= 9)
#endif

#ifndef iOS10_OR_Later
#define iOS10_OR_Later (dcystemVersion >= 10)
#endif

#ifndef iOS11_OR_Later
#define iOS11_OR_Later (dcystemVersion >= 11)
#endif

@end
