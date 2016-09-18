//
//  UIColor+Addition.h
//  maygolf
//
//  Created by maygolf on 15/7/1.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)colorWithHexStrint:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexStrint:(NSString *)hexString;

@end
