//
//  YQPublicMacro.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#ifndef YQPublicMacro_h
#define YQPublicMacro_h

// 屏幕尺寸
#define kScreenBounds   [[UIScreen mainScreen] bounds]
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)

// 屏幕的倍率
#define kScreenScale    ([UIScreen mainScreen].scale)

// 操作系统版本
#define kSystemVersion  [[[UIDevice currentDevice] systemVersion] floatValue]

// 颜色
#define YQRGBA(R,G,B,A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define YQRGB(R,G,B)     YQRGBA(R, G, B, 1.0)
#define YQHexColor(hexColor)  [UIColor colorWithRed:((hexColor & 0xFF0000)>>16)/255.0 green:((hexColor & 0x00FF00)>>8)/255.0 blue:(hexColor & 0x0000FF)/255.0 alpha:1.0]
#define YQRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// 图片
#define YQImage(imageName)    [UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]]

//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 设置视图圆角
#define YQViewBorderRadius(View, Radius, Width, Color)\\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 是否真机
#if TARGET_OS_IPHONE
    #define IS_Device YES
#else
    #define IS_Device  NO
#endif
// 是否模拟器
#if TARGET_IPHONE_SIMULATOR
    #define IS_Simulator    YES
#else
    #define IS_Simulator    NO
#endif

#endif /* YQPublicMacro_h */
