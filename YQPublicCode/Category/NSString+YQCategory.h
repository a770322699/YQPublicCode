//
//  NSString+YQCategory.h
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YQCategory)

- (NSString *)md5Encrypt;

+ (NSString *)stringWithInt:(int)intValue;
+ (NSString *)stringWithInteger:(NSInteger)integerValue;
+ (NSString *)stringWithDoubleValue:(double)value;
+ (NSString *)stringWithDoubleLocate:(double)value;
+ (NSString *)singleFloatStringWithDouble:(double)value;

// 判断长度，去除null
+ (NSString *)displayTextWithString:(NSString *)str;
+ (NSString *)textStringWithString:(NSString *)str;

// url参数字符串
+ (NSString *)parameterStringWithDictionary:(NSDictionary *)parameterDictionary;
// url 编码
+ (NSString *)urlStringWithString:(NSString *)string;
// url 解码
+ (NSString *)stringWithUrlString:(NSString *)urlString;

// 将数组、字典转换成json
+ (NSString *)jsonStringWithObject:(id)object;

// 根据格式显示时间
+ (NSString *)dateStringWithDate:(NSTimeInterval) date formatter:(NSString *)formatter;

/**
 *  根据距离今天的天数从formatter中获取格式化字符串，并根据格式化字符串格式化时间
 *
 *  @param date      要格式化的时间相对1970年的秒数
 *  @param formatter 获取格式化字符串的block，参数为指定时间到今天的天数，返回一个格式化字符串
 *
 *  @return 返回一个格式化的字符串
 */
+ (NSString *)dateStringWithDate:(NSTimeInterval)date formatterBlock:(NSString *(^)(NSInteger numberOfDay, NSInteger numberOfMonth, NSInteger numberOfYear))formatter;

@end
