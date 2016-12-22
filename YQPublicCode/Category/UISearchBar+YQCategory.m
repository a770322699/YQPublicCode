//
//  UISearchBar+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+YQCategory.h"
#import "UISearchBar+YQCategory.h"

const char *searchBarTextFieldKey    = "searchBarTextFieldKey";

@implementation UISearchBar (YQCategory)

- (UITextField *)textField{
    UITextField *textField = objc_getAssociatedObject(self, searchBarTextFieldKey);
    if (textField == nil) {
        textField = (UITextField *)[self viewWithKindOfClass:[UITextField class]];
        objc_setAssociatedObject(self, searchBarTextFieldKey, textField, OBJC_ASSOCIATION_ASSIGN);
    }
    return textField;
}

- (void)setCancelButtonTitle:(NSString *)title animation:(BOOL)animation{
    [self setShowsCancelButton:title animated:animation];
    if (title) {
        NSArray *buttons = [self viewsWithKindOfClass:[UIButton class]];
        [(UIButton *)[buttons lastObject] setTitle:title forState:UIControlStateNormal];
    }
}

@end
