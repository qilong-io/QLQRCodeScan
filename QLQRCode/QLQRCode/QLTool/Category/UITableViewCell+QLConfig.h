//
//  UITableViewCell+QLConfig.h
//  QLQRCode
//
//  Created by ql on 2018/6/4.
//  Copyright © 2018年 carystaloptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (QLConfig)

/**
 *  从nib文件中根据重用标识符注册UITableViewCell
 */
+ (void)dc_registerTableView:(UITableView *)tableView nibIdentifier:(NSString *)identifier;

/**
 *  从class中根据重用标识符注册UITableViewCell
 */
+ (void)dc_registerTableView:(UITableView *)tableView classIdentifier:(NSString *)identifier;


/**
 *  根据model配置UITableViewCell，设置UITableViewCell内容
 */
- (void)dc_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath;

@end
