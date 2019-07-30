//
//  SmUtility.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "SmUtility.h"

@implementation SmUtility

#pragma mark - 生成唯一值
+ (NSString*)sm_uuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

+ (NSString *)sm_currentDateAndTime {
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddHHmmssSSS"];
    [dateFormatter setTimeZone:zone];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSString *)sm_getCurrentTimeStamp {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",time*1000];
}

#pragma mark - 判断
+ (BOOL)sm_objectIsNullAndEmpty:(NSObject *)object {
    if ([object isEqual:[NSNull null]] ||
        object == nil) {
        return YES;
    }else if ([object isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)object;
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([string isEqual:@""]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 时间转换
+ (NSString *)sm_stampForDate:(NSDate *)date {
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *stamp = [NSString stringWithFormat:@"%.0f",time*1000];
    return stamp;
}

+ (NSString *)sm_stringForStamp:(NSString *)timeStamp dateFormattor:(NSString *)dateFormatter {
    NSTimeInterval stamp = [timeStamp longLongValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp];
    return [self sm_stringForDate:date dateFormattor:dateFormatter];
}

+ (NSString *)sm_stringForDate:(NSDate *)date dateFormattor:(NSString *)dateFormatter {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:dateFormatter];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)sm_stringForString:(NSString *)dateStr dateFormattor:(NSString *)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSString * str = [self sm_stringForDate:date dateFormattor:dateFormatter];
    return str;
}

+ (NSString *)sm_stringFewDaysAgoForDate:(NSDate *)date count:(NSInteger)count dateFormattor:(NSString *)dateFormatter {
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSDate *theDate = [date initWithTimeIntervalSinceNow: -oneDay*count ];
    NSString *agoDate = [self sm_stringForDate:theDate dateFormattor:dateFormatter];
    return agoDate;
}

@end
