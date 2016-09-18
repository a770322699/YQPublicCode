//
//  YQFunction.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <objc/runtime.h>
#import "YQFunction.h"

/**
 判断一个点是否在一个矩形内
 
 - parameter aPoint:   点
 - parameter rect:     矩形,点和矩形的坐标必选是同意参照物
 - parameter boundary: 是否包括边界，若为true，在边界也返回true
 
 - returns: 结果
 */
bool pointInRect(CGPoint aPoint, CGRect aRect, bool boundary){
    if (boundary) {
        return aPoint.x >= aRect.origin.x && aPoint.x <= CGRectGetMaxX(aRect) && aPoint.y >= aRect.origin.y && aPoint.y <= CGRectGetMaxY(aRect);
    }else{
        return aPoint.x > aRect.origin.x && aPoint.x < CGRectGetMaxX(aRect) && aPoint.y > aRect.origin.y && aPoint.y < CGRectGetMaxY(aRect);
    }
}

CGRect CGRectMakeOriginSize(CGPoint origin, CGSize size){
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}


// 方法替换
void methodSwizzle(Class theClass, SEL origSEL, SEL overrideSEL){
    Method origMethod = class_getInstanceMethod(theClass, origSEL);
    Method overrideMethod= class_getInstanceMethod(theClass, overrideSEL);
    if (class_addMethod(theClass, origSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(theClass, overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}