//
//  UIView+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YQCategory)

// 返回子视图上的第一响应者，没有返回nil
- (UIView *)firstResponseder;

// 从子视图中递归寻找某个类型的视图（包括子类型）
- (UIView *)viewWithKindOfClass:(Class)aClass;
// 从子视图中递归查询所有某个类型的视图（包括子类型）
- (NSArray *)ViewsWithKindOfClass:(Class)aClass;
// 从子视图中找出某个类型的视图（不包括子类型）
- (UIView *)viewWithMemberOfClass:(Class)aClass;
// 从子视图中递归查询所有某个类型的视图（不包括子类型）
- (NSArray *)ViewsWithMembaerOfClass:(Class)aClass;

@end
