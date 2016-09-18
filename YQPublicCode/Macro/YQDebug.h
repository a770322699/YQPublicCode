//
//  YQDebug.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#ifndef YQDebug_h
#define YQDebug_h

// 日志
#ifdef DEBUG
#   define YQLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define YQLog(...)
#endif

// 强、弱引用对象
#define YQ_WEAK(instance, weakInstance)     __weak __typeof(&*instance) weakInstance = instance;
#define YQ_STRONG(instance, weakInstance)   __strong __typeof(&*instance) weakInstance = instance;
#define YQ_WeakSelf                         YQ_WEAK(self, weakSelf)
#define YQ_StrongSelf                       YQ_STRONG(self, weakSelf)

#endif /* YQDebug_h */
