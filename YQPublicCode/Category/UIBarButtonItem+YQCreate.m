//
//  UIBarButtonItem+YQCreate.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "UIBarButtonItem+YQCreate.h"

@interface UIBarButtonItem ()

@property (nonatomic, strong) void(^blockHandler)(id sender);

@end

@implementation UIBarButtonItem (YQCreate)

- (void)blockAction{
    if (self.blockHandler) {
        self.blockHandler(self);
    }
}

// 用图片创建
+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    return  [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
}

// 用图片创建
+ (UIBarButtonItem *)barButtonWithImage:(UIImage *)image handler:(void (^)(id sender))action
{
    UIBarButtonItem *item = [self barButtonWithImage:image target:nil action:@selector(blockAction)];
    item.target = item;
    item.blockHandler = action;
    return item;
}

// 用标题创建
+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

// 用标题创建
+ (UIBarButtonItem *)barButtonWithTitle:(NSString *)title handler:(void (^)(id sender))action
{
    UIBarButtonItem *item = [self barButtonWithTitle:title target:nil action:@selector(blockAction)];
    item.target = item;
    item.blockHandler = action;
    return item;
}

// 创建系统类型的
+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem )systemItem target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
}

// 创建系统类型的
+ (UIBarButtonItem *)barButtonWithSystemItem:(UIBarButtonSystemItem )systemItem handler:(void (^)(id sender))action
{
    UIBarButtonItem *item = [self barButtonWithSystemItem:systemItem target:nil action:@selector(blockAction)];
    item.target = item;
    item.blockHandler = action;
    return item;
}

//// 返回按钮
//+ (UIBarButtonItem *)backButtonItemAction:(void (^) (id sender)) action
//{
    //return [self backButtonItemTitle:@"返回" action:action];
//}

//+ (UIBarButtonItem *)backButtonItemTitle:(NSString *)title action:(void (^) (id sender)) action
//{
    //UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //[button setImage:iNavigationBarBack forState:UIControlStateNormal];
    //[button setTitle:title forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //button.frame = CGRectMake(0, 0, 50, 30);
    //button.imageEdgeInsets = UIEdgeInsetsMake(2, -14, 2,0);
    //button.titleEdgeInsets = UIEdgeInsetsMake(0, -23, 0, 0);
    //button.titleLabel.font = [UIFont systemFontOfSize:17.0];
    //[button bk_addEventHandler:action forControlEvents:UIControlEventTouchUpInside];
    
    //return [[UIBarButtonItem alloc] initWithCustomView:button];
//}

//+ (UIBarButtonItem *)userBarButonWithAvatar:(NSString *)avararUrlStr handler:(void (^) (id sender))action
//{
    //UIImageView *userView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)];
    //userView.backgroundColor = [UIColor clearColor];
    //[userView setImageWithURL:[NSURL URLWithString:avararUrlStr] placeholer:iUserDefault width:34 height:0];
    //userView.userInteractionEnabled = YES;
    //userView.layer.masksToBounds = YES;
    //userView.layer.cornerRadius = 17;
    
    //UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        //if (action) {
            //action(nil);
        //}
    //}];
    //[userView addGestureRecognizer:ges];
    
    //return [[UIBarButtonItem alloc] initWithCustomView:userView];
//}

// 弹簧
+ (UIBarButtonItem *)flexibleSpaceItem
{
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

@end
