//
//  QLMacros.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef QLMacros_h
#define QLMacros_h

// width height
#define Screen_Width                 ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height                ([UIScreen mainScreen].bounds.size.height)

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// 获取安全区周边距离
#define VIEWSAFEAREAINSETS(view)\
({\
    UIEdgeInsets i; \
    if(@available(iOS 11.0, *)){\
        i = view.safeAreaInsets;\
    } else {\
        i = UIEdgeInsetsZero;\
    }\
    i;\
})

//获取距离顶部安全距离（状态栏高度）
#define HEITHT(safeAreaInsets)\
({\
    CGFloat height = safeAreaInsets.top > 0 ? safeAreaInsets.top : 20.0;\
    height;\
})
//安全区高度
#define screenSafeAreaHeight (self.view.bounds.size.height - VIEWSAFEAREAINSETS([UIApplication sharedApplication].keyWindow).bottom)
//安全区开始地方高度
#define screenTop (44 + HEITHT(VIEWSAFEAREAINSETS([UIApplication sharedApplication].keyWindow)))

//AppDelegate对象
#define App_delegate_instance [[UIApplication sharedApplication] delegate]

#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

// Get the path with name and suffix
#define FILE_PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]
// Load the file of the image
#define FILE_IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// RGB
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]
#define RGBColor(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBAColor(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// App Name
#define AppDisplayName          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// RGB convert（eg.0x330099）
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]


#define QLWeakSelf __weak typeof(self) weakSelf = self;

/** 将服务器返回的数据写成plist */
#define QLAFNWriteToPlist(filename) [responseObject writeToFile:[NSString stringWithFormat:@"/Users/ql/Desktop/PLIST/%@.plist", filename] atomically:YES];

/// constant
static const CGFloat TabBarHeight = 49.0f;
//static const CGFloat StatusBarHeight = 20.0f;
static const CGFloat ToolBarHeight = 44.0f;
static const CGFloat NavgationBarHeight = 44.0f;
static const CGFloat SearchBarHeight = 44.0f;

static const CGFloat TableContentMargin = 15.0f;
static const CGFloat StandardCellHeight = 44.0f;
static const CGFloat SectionHeaderHeight = 22.5f;

static const int FindnowTotalUse = 400;
static const int TrackingTotalUse = 400;
static const int ScheduleTotalUse = 300;


#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height


// Debug with the function line and content
#if DEBUG
#define QLog(FORMAT, ...)  NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(FORMAT), ##__VA_ARGS__] );
#else
#define QLog(FORMAT, ...) nil
#endif

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 4S
#define iPhone4S [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 480.0f

// 判断是否为 iPhoneX
#define iPhoneX [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 812.0f

// 判断是否为 iPhone 5_5S_SE
#define iPhone5_5S_SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6_6s_7_8
#define iPhone6_6s_7 [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6plus_6splus_7plus_8plus
#define iPhone6Plus_6sPlus_7plus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))


//https://www.jianshu.com/p/2bd75aba7119 //相关解释
#ifndef QLSYNTH_DUMMY_CLASS
#define QLSYNTH_DUMMY_CLASS(_name_) \
@interface QLSYNTH_DUMMY_CLASS ## _name_ : NSObject @end \
@implementation QLSYNTH_DUMMY_CLASS ## _name_ @end
#endif


#endif /* QLMacros_h */
