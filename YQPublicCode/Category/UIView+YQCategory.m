//
//  UIView+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "UIView+YQCategory.h"

@implementation UIView (YQCategory)

// 返回子视图上的第一响应者，没有返回nil
- (UIView *)firstResponseder
{
    for ( UIView *childView in self.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] ) return childView;
        UIView *result = [childView firstResponseder];
        if ( result ) return result;
    }
    return nil;
}

// 从子视图中递归寻找某个类型的视图（包括子类型）
- (UIView *)viewWithKindOfClass:(Class)aClass{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:aClass]) return subView;
        UIView *resultView = [subView viewWithKindOfClass:aClass];
        if (resultView) return resultView;
    }
    return nil;
}
// 从子视图中递归查询所有某个类型的视图（包括子类型）
- (NSArray *)viewsWithKindOfClass:(Class)aClass{
    NSMutableArray *views = nil;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:aClass]) {
            if (views == nil) views = [NSMutableArray array];
            [views addObject:subView];
        }
        NSArray *subViewResultViews = [subView viewsWithKindOfClass:aClass];
        if (subViewResultViews.count) {
            if (views == nil) views = [NSMutableArray array];
            [views addObjectsFromArray:subViewResultViews];
        }
    }
    return views;
}

// 从子视图中找出某个类型的视图（不包括子类型）
- (UIView *)viewWithMemberOfClass:(Class)aClass{
    for (UIView *subView in self.subviews) {
        if ([subView isMemberOfClass:aClass]) return subView;
        UIView *resultView = [subView viewWithMemberOfClass:aClass];
        if (resultView) return resultView;
    }
    return nil;
}
// 从子视图中递归查询所有某个类型的视图（不包括子类型）
- (NSArray *)viewsWithMembaerOfClass:(Class)aClass{
    NSMutableArray *views = nil;
    for (UIView *subView in self.subviews) {
        if ([subView isMemberOfClass:aClass]) {
            if (views == nil) views = [NSMutableArray array];
            [views addObject:subView];
        }
        NSArray *subViewResultViews = [subView viewsWithMembaerOfClass:aClass];
        if (subViewResultViews.count) {
            if (views == nil) views = [NSMutableArray array];
            [views addObjectsFromArray:subViewResultViews];
        }
    }
    return views;
}

@end
