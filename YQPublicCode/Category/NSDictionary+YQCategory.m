//
//  NSDictionary+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "NSDictionary+YQCategory.h"

@implementation NSDictionary (YQCategory)

- (NSInteger)integerValueForKey:(NSString *)key
{
    NSString *objc = [self objectForKey:key];
    if ([objc isKindOfClass:[NSNull class]]) {
        return 0;
    }
    
    return [objc integerValue];
}

- (double)doubleValueForKey:(NSString *)key
{
    return [[self objectForKey:key] doubleValue];
}

- (NSString *)stringForKey:(NSString *)key
{
    NSValue *value = [self objectForKey:key];
    NSString *string = nil;
    
    if (value) {
        if ([value isKindOfClass:[NSString class]]) {
            string = (NSString *)value;
        }else if (![value isKindOfClass:[NSNull class]]){
            string = [NSString stringWithFormat:@"%@", value];
        }
    }
    return string;
}


+ (NSDictionary *)groupDictionaryFromMembers:(NSArray *)members withKeyPath:(NSString *)keyPath{
    return [self groupDictionaryFromMembers:members toGroup:nil otherMemberKeyPath:keyPath defaultKey:GroupDictionaryKeyDefault];
}

+ (NSDictionary *)groupDictionaryFromMembers:(NSArray *)members toGroup:(id(^)(id member))groupKey otherMemberKeyPath:(NSString *)keyPath defaultKey:(id)defaultKey{
    if (members.count == 0) return nil;
    
    // 定义结果字典
    NSMutableDictionary *resultDictionary = nil;
    
    for (id member in members) {
        // 获取member应该被分组的key
        id key = nil;
        // 从block重获取key
        if (groupKey) key = groupKey(member);
        if (key == nil) {   // 么有从block中获取到key
            if (keyPath) {  // 根据keyPath获取key
                // 获取keyPath对应的值
                id keyPathValue = [member valueForKeyPath:keyPath];
                
                // 获取keyPath对应值的字符串表示
                NSString *keyPathString = nil;
                if ([keyPathValue isKindOfClass:[NSString class]]) {
                    keyPathString = keyPathValue;
                }else{
                    keyPathString = [NSString stringWithFormat:@"%@",keyPathValue];
                }
                
                if (keyPathString.length) {
                    // 获取首字母
                    NSString *prefix = [keyPathString substringToIndex:1];
                    [prefix uppercaseString];
                    if ('A' <= *[prefix UTF8String] && *[prefix UTF8String] <= 'Z') {
                        key = prefix;
                    }
                }
            }
        }
        if (key == nil) { // 根据keyPath规则也没获取到key
            if (defaultKey) key = defaultKey;
        }
        
        if (key) { // 若获取到key，放成员放入分组
            if (resultDictionary == nil) resultDictionary = [NSMutableDictionary dictionary];
            
            // 获取分组数组
            NSMutableArray *groupArray = [resultDictionary objectForKey:key];
            // 若还没有该分组，创建一个分组,并存入结果字典
            if (groupArray == nil) {
                groupArray = [NSMutableArray array];
                [resultDictionary setObject:groupArray forKey:key];
            }
            // 将成员添加到该分组
            [groupArray addObject:member];
        }
    }
    return resultDictionary;
}

@end
