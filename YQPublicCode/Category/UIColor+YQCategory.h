//
//  UIColor+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YQCategory)

+ (UIColor *)colorWithHexStrint:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexStrint:(NSString *)hexString;

@end
