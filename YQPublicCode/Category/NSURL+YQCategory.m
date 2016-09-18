//
//  NSURL+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "NSURL+YQCategory.h"

@implementation NSURL (YQCategory)

// 参数字典
- (NSDictionary *)parameterDictionary
{
    NSString *parameterString = [[self.absoluteString componentsSeparatedByString:@"?"] lastObject];
    NSArray *parameterArray = [parameterString componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *resultDic = nil;
    for (NSString *parameterItem in parameterArray) {
        if (resultDic == nil) {
            resultDic = [NSMutableDictionary dictionary];
        }
        
        NSArray *parameterKeyValue = [parameterItem componentsSeparatedByString:@"="];
        [resultDic setValue:[parameterKeyValue lastObject] forKey:[parameterKeyValue firstObject]];
    }
    
    return resultDic;
}


@end
