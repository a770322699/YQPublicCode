//
//  NSObject+YQPosition.m
//  maygolf
//
//  Created by maygolf on 16/6/17.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "NSObject+YQPosition.h"

const char *NSObjectYQPositionKey   = "NSObjectYQPositionKey";

@implementation NSObject (YQPosition)

#pragma mark - getter
- (YQPosition)yq_position{
    CGPoint point = [objc_getAssociatedObject(self, NSObjectYQPositionKey) CGPointValue];
    return YQPositionMake((NSInteger)point.x, (NSInteger)point.y);
}

#pragma mark - setting
- (void)setYq_position:(YQPosition)yq_position{
    objc_setAssociatedObject(self, NSObjectYQPositionKey, [NSValue valueWithCGPoint:CGPointMake(yq_position.x, yq_position.y)], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
