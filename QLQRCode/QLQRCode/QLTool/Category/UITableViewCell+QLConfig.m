//
//  UITableViewCell+QLConfig.m
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import "UITableViewCell+QLConfig.h"

@implementation UITableViewCell (QLConfig)

+ (UINib *)nibWithIdentifier:(NSString *)identifier {
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - public
+ (void)dc_registerTableView:(UITableView *)tableView nibIdentifier:(NSString *)identifier {
    [tableView registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}

+ (void)dc_registerTableView:(UITableView *)tableView classIdentifier:(NSString *)identifier {
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
}


#pragma mark - Rewrite these func in SubClass !
- (void)dc_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    // Rewrite this func in SubClass !
}

@end
