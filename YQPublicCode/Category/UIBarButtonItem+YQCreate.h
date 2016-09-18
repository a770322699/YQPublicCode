//
//  UIBarButtonItem+YQCreate.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YQCreate)

// 用图片创建
+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;
// 用图片创建
+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image handler:(void (^)(id sender))action;

// 用标题创建
+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
// 用标题创建
+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title handler:(void (^)(id sender))action;

// 创建系统类型的
+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem )systemItem target:(id)target action:(SEL)action;
// 创建系统类型的
+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem )systemItem handler:(void (^)(id sender))action;

//// 返回按钮
//+ (UIBarButtonItem *)backButtonItemAction:(void (^) (id sender)) action;
//+ (UIBarButtonItem *)backButtonItemTitle:(NSString *)title action:(void (^) (id sender)) action;


//// 用户头像
//+ (UIBarButtonItem *)userBarButonWithAvatar:(NSString *)avararUrlStr handler:(void (^) (id sender))action;

// 弹簧
+ (UIBarButtonItem *)flexibleSpaceItem;

@end
