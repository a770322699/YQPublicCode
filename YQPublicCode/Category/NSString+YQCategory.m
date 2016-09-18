//
//  NSString+YQCategory.m
//  YQPublicCode
//
//  Created by maygolf on 16/9/18.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+YQCategory.h"

@implementation NSString (YQCategory)

- (NSString *)md5Encrypt {
    //    const char *original_str = [self UTF8String];
    //    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //    CC_MD5(original_str, strlen(original_str), result);
    //    NSMutableString *hash = [NSMutableString string];
    //    for (int i = 0; i < 16; i++)
    //        [hash appendFormat:@"%02X", result[i]];
    //    return [hash lowercaseString];
    
    //    const char *cStr = [self UTF8String];
    //    unsigned char result[32];
    //    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    //    return [NSString stringWithFormat:
    //            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
    //            result[0], result[1], result[2], result[3],
    //            result[4], result[5], result[6], result[7],
    //            result[8], result[9], result[10], result[11],
    //            result[12], result[13], result[14], result[15]
    //            ];
    
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (int)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)stringWithInt:(int)intValue
{
    return [NSString stringWithFormat:@"%d",intValue];
}

+ (NSString *)stringWithInteger:(NSInteger)integerValue
{
    return [NSString stringWithFormat:@"%ld",(long)integerValue];
}

+ (NSString *)stringWithDoubleValue:(double)value
{
    return [NSString stringWithFormat:@"%.1lf",value];
}

+ (NSString *)stringWithDoubleLocate:(double)value
{
    return [NSString stringWithFormat:@"%lf",value];
}

+ (NSString *)displayTextWithString:(NSString *)str
{
    return (str.length && ![str isEqualToString:@"(null)"]) ? str : @"";
}

+ (NSString *)singleFloatStringWithDouble:(double)value
{
    return [NSString stringWithFormat:@"%.1lf",value];
}

+ (NSString *)textStringWithString:(NSString *)str
{
    if (str.length && ![str isEqualToString:@"(null)"]) {
        return str;
    }
    return @"";
}

// url参数字符串
+ (NSString *)parameterStringWithDictionary:(NSDictionary *)parameterDictionary
{
    NSMutableString *resultString = nil;
    for (NSString *key in parameterDictionary) {
        if (resultString == nil) {
            resultString = [NSMutableString stringWithFormat:@"%@=%@",key,[NSString urlStringWithString:[NSString stringWithFormat:@"%@",[parameterDictionary objectForKey:key]]]];
        }else{
            [resultString appendFormat:@"&%@=%@",key,[NSString stringWithUrlString:[NSString stringWithFormat:@"%@",[parameterDictionary objectForKey:key]]]];
        }
    }
    return resultString;
}

// url 编码
+ (NSString *)urlStringWithString:(NSString *)string
{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
// url 解码
+ (NSString *)stringWithUrlString:(NSString *)urlString
{
    return [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

// 将数组、字典转换成json
+ (NSString *)jsonStringWithObject:(id)object
{
    if (object) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        
        if ([jsonData length] > 0 && error == nil) {
            
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
    }
    return nil;
}


#pragma mark - private
+ (NSDateFormatter *)dateFormatter{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
        }
    });
    return dateFormatter;
}
#pragma mark - public
// 根据格式显示时间
+ (NSString *)dateStringWithDate:(NSTimeInterval) date formatter:(NSString *)formatter{
    NSDateFormatter *dateFormattr = [self dateFormatter];
    dateFormattr.dateFormat = formatter;
    return [dateFormattr stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
}

/**
 *  根据距离今天的天数从formatter中获取格式化字符串，并根据格式化字符串格式化时间
 *
 *  @param date      要格式化的时间相对1970年的秒数
 *  @param formatter 获取格式化字符串的block，参数为指定时间到今天的天数，返回一个格式化字符串
 *
 *  @return 返回一个格式化的字符串
 */
+ (NSString *)dateStringWithDate:(NSTimeInterval)date formatterBlock:(NSString *(^)(NSInteger numberOfDay, NSInteger numberOfMonth, NSInteger numberOfYear))formatter{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *fromDay = nil;
    NSDate *toDay = nil;
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDay interval:NULL forDate:[NSDate dateWithTimeIntervalSince1970:date]];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDay interval:NULL forDate:[NSDate date]];
    NSDateComponents *dayComponents = [calendar components:NSCalendarUnitDay fromDate:fromDay toDate:toDay options:0];
    
    NSDate *fromMonth = nil;
    NSDate *toMonth = nil;
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&fromMonth interval:NULL forDate:[NSDate dateWithTimeIntervalSince1970:date]];
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&toMonth interval:NULL forDate:[NSDate date]];
    NSDateComponents *monthComponents = [calendar components:NSCalendarUnitMonth fromDate:fromMonth toDate:toMonth options:0];
    
    NSDate *fromYear = nil;
    NSDate *toYear = nil;
    [calendar rangeOfUnit:NSCalendarUnitYear startDate:&fromYear interval:NULL forDate:[NSDate dateWithTimeIntervalSince1970:date]];
    [calendar rangeOfUnit:NSCalendarUnitYear startDate:&toYear interval:NULL forDate:[NSDate date]];
    NSDateComponents *yearComponents = [calendar components:NSCalendarUnitYear fromDate:fromYear toDate:toYear options:0];
    
    return [self dateStringWithDate:date formatter:formatter(dayComponents.day, monthComponents.month, yearComponents.year)];
}

@end
