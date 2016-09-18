//
//  YQTextViewLimitLenthDelegate.h
//  maygolf
//
//  Created by maygolf on 16/4/19.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YQTextViewLimitLenthDelegate : NSObject

@property (nonatomic, assign) NSInteger maxLenth;                        // 最大长度

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(UITextView *)textView;
+ (NSRange)textViewHighlightRange:(UITextView *)textView;

@end
