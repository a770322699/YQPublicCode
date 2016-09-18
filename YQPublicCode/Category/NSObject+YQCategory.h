//
//  NSObject+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YQCategory)

- (void)encodeInRuntimeWithCoder:(NSCoder *)aCoder;
- (void)decodeInRuntimeWithCoder:(NSCoder *)aDecoder;

@end
