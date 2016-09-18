//
//  UICollectionViewCell+YQProperty.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <objc/runtime.h>

#import "UICollectionViewCell+YQProperty.h"

const char *UICollectionViewCellYqSelectBgViewKey           = "UICollectionViewCellYqSelectBgViewKey";
const char *UICollectionViewCellYqBgViewKey                 = "UICollectionViewCellYqBgViewKey";

@interface UICollectionViewCell ()

@property (nonatomic, strong) UIView *yq_selectBgView;
@property (nonatomic, strong) UIView *yq_bgView;

@end

@implementation UICollectionViewCell (YQProperty)

#pragma mark - getter
- (UIView *)yq_selectBgView{
    UIView *selectBgView = objc_getAssociatedObject(self, UICollectionViewCellYqSelectBgViewKey);
    if (selectBgView == nil) {
        selectBgView = [[UIView alloc] init];
        self.yq_selectBgView = selectBgView;
    }
    
    return selectBgView;
}

- (UIView *)yq_bgView{
    UIView *bgView = objc_getAssociatedObject(self, UICollectionViewCellYqBgViewKey);
    if (bgView == nil) {
        bgView = [[UIView alloc] init];
        self.yq_bgView = bgView;
    }
    
    return bgView;
}

- (UIColor *)yq_selectBgColor{
    return self.selectedBackgroundView.backgroundColor;
}

- (UIColor *)yq_bgColor{
    return self.backgroundView.backgroundColor;
}

#pragma mark - setting
- (void)setYq_selectBgView:(UIView *)yq_selectBgView{
    objc_setAssociatedObject(self, UICollectionViewCellYqSelectBgViewKey, yq_selectBgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYq_bgView:(UIView *)yq_bgView{
    objc_setAssociatedObject(self, UICollectionViewCellYqBgViewKey, yq_bgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYq_selectBgColor:(UIColor *)yq_selectBgColor{
    if (yq_selectBgColor) {
        self.yq_selectBgView.backgroundColor = yq_selectBgColor;
        self.selectedBackgroundView = self.yq_selectBgView;
    }else{
        self.selectedBackgroundView = nil;
    }
}

- (void)setYq_bgColor:(UIColor *)yq_bgColor{
    if (yq_bgColor) {
        self.yq_bgView.backgroundColor = yq_bgColor;
        self.backgroundView = self.yq_bgView;
    }else{
        self.backgroundView = nil;
    }
}

@end
