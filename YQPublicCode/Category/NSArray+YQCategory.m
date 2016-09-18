//
//  NSArray+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "NSArray+YQCategory.h"

@implementation NSArray (YQCategory)

// 将数组中元素的某一属性用separator连接起来
- (NSString *)componentsJoinedKeyPath:(NSString *)keyPath ByString:(NSString *)separator
{
    int i=0;
    NSMutableString *compenStr = nil;
    for (NSObject *objc in self) {
        if (i == 0) {
            compenStr = [NSMutableString stringWithFormat:@"%@",[objc valueForKeyPath:keyPath]];
        }else{
            [compenStr appendFormat:@"%@%@",separator,[objc valueForKeyPath:keyPath]];
        }
        i++;
    }
    return compenStr;
}

// 求和，keypath对应的属性可以是数值型、nsnumber、以及数值字符串,若keypath为nil，认为数组的元素是nsnubmer或者nsstring对象
- (double)sumComponentsJoinedKeyPath:(NSString *)keyPath
{
    double resultValue = 0;
    
    for (id object in self) {
        double value = 0;
        id objc = nil;
        if (keyPath.length) {
            
            objc = [object valueForKeyPath:keyPath];
        }else{
            objc = object;
        }
        
        if ([objc isKindOfClass:[NSString class]] || [objc isKindOfClass:[NSNumber class]]) {
            value = [objc doubleValue];
        }
        
        resultValue += value;
    }
    
    return  resultValue;
}

@end
