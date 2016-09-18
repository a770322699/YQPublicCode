//
//  UITableViewCell+SubViewBgColor.m
//  maygolf
//
//  Created by maygolf on 16/7/19.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <objc/runtime.h>

#import "YQFunction.h"
#import "UITableViewCell+SubViewBgColor.h"

const char *mgKeepBgColorWhenHilightKey = "mgKeepBgColorWhenHilightKey";
const char *mgOriginalColorKey          = "mgOriginalColorKey";

@interface UIView ()

@property (nonatomic, strong) UIColor *mg_originalColor;

@end

@implementation UIView (SubViewBgColor)

- (BOOL)mg_keepBgColorWhenHilight{
    return [objc_getAssociatedObject(self, mgKeepBgColorWhenHilightKey) boolValue];
}

- (void)setMg_keepBgColorWhenHilight:(BOOL)mg_keepBgColorWhenHilight{
    objc_setAssociatedObject(self, mgKeepBgColorWhenHilightKey, @(mg_keepBgColorWhenHilight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)mg_originalColor{
    return objc_getAssociatedObject(self, mgOriginalColorKey);
}

- (void)setMg_originalColor:(UIColor *)mg_originalColor{
    objc_setAssociatedObject(self, mgOriginalColorKey, mg_originalColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - private
- (void)setSubViewsOriginalColorForBgColor{
    if (self.mg_keepBgColorWhenHilight) {
        self.mg_originalColor = self.backgroundColor;
    }
    [self.subviews makeObjectsPerformSelector:@selector(setSubViewsOriginalColorForBgColor)];
}

- (void)setSubviewsBgColorForOriginalColor{
    if (self.mg_keepBgColorWhenHilight) {
        self.backgroundColor = self.mg_originalColor;
    }
    
    [self.subviews makeObjectsPerformSelector:@selector(setSubviewsBgColorForOriginalColor)];
}

@end

@implementation UITableViewCell (SubViewBgColor)

+ (void)load{
    methodSwizzle([self class], @selector(setHighlighted:animated:), @selector(mgSetHighlighted:animated:));
}

- (void)mgSetHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    if (self.isHighlighted == 0 && highlighted) {
        [self.contentView setSubViewsOriginalColorForBgColor];
        [self mgSetHighlighted:highlighted animated:animated];
        [self.contentView setSubviewsBgColorForOriginalColor];
    }else{
        [self mgSetHighlighted:highlighted animated:animated];
    }
}

@end
