//
//  YQFunction.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 判断一个点是否在一个矩形内
 
 - parameter aPoint:   点
 - parameter rect:     矩形,点和矩形的坐标必选是同意参照物
 - parameter boundary: 是否包括边界，若为true，在边界也返回true
 
 - returns: 结果
 */
bool pointInRect(CGPoint aPoint, CGRect aRect, bool boundary);

CGRect CGRectMakeOriginSize(CGPoint origin, CGSize size);

// 方法替换
void methodSwizzle(Class theClass, SEL origSEL, SEL overrideSEL);