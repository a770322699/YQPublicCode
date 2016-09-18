//
//  UISearchBar+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (YQCategory)

@property (nonatomic, readonly) UITextField *textField;

/**
 *  设置取消按钮的标题
 *
 *  @param title     标题，若为nil，隐藏取消按钮
 *  @param animation 是否需要动画
 */
- (void)setCancelButtonTitle:(NSString *)title animation:(BOOL)animation;

@end
