//
//  UIImage+addition.h
//  maygolf
//
//  Created by maygolf on 13-12-30.
//  Copyright (c) 2013年 maygolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (addition)

+ (UIImage *)fixOrientation:(UIImage *)aImage;
+ (UIImage *)scaleAndRotateImage:(UIImage *)image;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

// 图片压缩
- (NSData *)zipImageWithQuality:(float)quality;
//  裁剪图片(rect已像素计算)
- (UIImage *)cutFromRect:(CGRect)rect;

@end
