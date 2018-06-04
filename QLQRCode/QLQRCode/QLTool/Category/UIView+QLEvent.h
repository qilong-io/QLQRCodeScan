//
//  UIView+QLEvent.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ViewEventsBlock)(void);

@interface UIView (QLEvent)

/**
 *  block 传递事件
 */
@property (nonatomic, copy) ViewEventsBlock viewEventsBlock;

@end
