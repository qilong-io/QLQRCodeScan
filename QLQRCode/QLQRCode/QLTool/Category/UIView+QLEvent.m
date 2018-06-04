//
//  UIView+QLEvent.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UIView+QLEvent.h"
#import <objc/runtime.h>

@implementation UIView (QLEvent)

- (ViewEventsBlock)viewEventsBlock {
    return objc_getAssociatedObject(self, @selector(viewEventsBlock));
}


- (void)setViewEventsBlock:(ViewEventsBlock)viewEventsBlock {
    objc_setAssociatedObject(self, @selector(viewEventsBlock), viewEventsBlock, OBJC_ASSOCIATION_COPY);
}

@end
