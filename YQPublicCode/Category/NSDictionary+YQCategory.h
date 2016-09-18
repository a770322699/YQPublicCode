//
//  NSDictionary+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GroupDictionaryKeyDefault           @"#"

@interface NSDictionary (YQCategory)

- (NSInteger)integerValueForKey:(NSString *)key;
- (double)doubleValueForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

// 将数组中的成员进行分组，将同一组中的成员放入同一数组中，并作为value以给定的key放入结果字典中
+ (NSDictionary *)groupDictionaryFromMembers:(NSArray *)members withKeyPath:(NSString *)keyPath;

/**
 *  将数组中的成员进行分组，将同一组中的成员放入同一数组中，并作为value以给定的key放入结果字典中
 *
 *  @param members    要进行分组的成员数组
 *  @param groupKey   一个通过成员返回该成员对应分组key的block
 *  @param keyPath    若groupKey为nil，或者groupKey返回一个nil，那么根据成员的keyPath属性进行按首字母分组，首字母部分大小写(即：A与a分在同一组)，并放入以其首字母为key的分组中
 *  @param defaultKey 若既没有按照groupKey分组（groupKey为nil，或者返回nil），又没有按照keyPath分组（keyPath为nil），那么就放入以defaultKey为key的分组中，若defaultkey为nil，那么该成员不被分组
 *
 *  @return 返回一个完成分组的字典
 */
+ (NSDictionary *)groupDictionaryFromMembers:(NSArray *)members toGroup:(id(^)(id member))groupKey otherMemberKeyPath:(NSString *)keyPath defaultKey:(id)defaultKey;

@end
