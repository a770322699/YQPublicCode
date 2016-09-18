//
//  NSObject+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+YQCategory.h"

@implementation NSObject (YQCategory)

- (void)encodeInRuntimeWithCoder:(NSCoder *)aCoder{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *name = [[NSString alloc] initWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
    
    free(ivars);
}

- (void)decodeInRuntimeWithCoder:(NSCoder *)aDecoder{
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *name = [[NSString alloc] initWithUTF8String:ivar_getName(ivar)];
        [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
    }
    
    free(ivars);
}

@end
