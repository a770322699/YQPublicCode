//
//  NSArray+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YQCategory)

// 将数组中元素的某一属性用separator连接起来
- (NSString *)componentsJoinedKeyPath:(NSString *)keyPath ByString:(NSString *)separator;

// 求和，keypath对应的属性可以是数值型、nsnumber、以及数值字符串,若keypath为nil，认为数组的元素是nsnubmer或者nsstring对象
- (double)sumComponentsJoinedKeyPath:(NSString *)keyPath;

@end
