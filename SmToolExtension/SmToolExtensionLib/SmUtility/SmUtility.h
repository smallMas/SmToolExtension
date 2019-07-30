//
//  SmUtility.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmUtility : NSObject

#pragma mark - 生成唯一值
/*!
 * 生成一个UUID
 **/
+ (NSString*)sm_uuid;

/*!
 * 获取当前的时间sss
 **/
+ (NSString *)sm_currentDateAndTime;

/*!
 * 获取当前时间戳
 **/
+ (NSString *)sm_getCurrentTimeStamp;

#pragma mark - 判断
/*!
 * 判断object是否为空 NSNULL 空字符串
 *
 * @param object 对象
 */
+ (BOOL)sm_objectIsNullAndEmpty:(NSObject *)object;

#pragma mark - 时间转换
/*! date转时间戳 */
+ (NSString *)sm_stampForDate:(NSDate *)date;

/*! 时间戳转格式字符串 */
+ (NSString *)sm_stringForStamp:(NSString *)timeStamp dateFormattor:(NSString *)dateFormatter;

/*! 时间对象转格式字符串 */
+ (NSString *)sm_stringForDate:(NSDate *)date dateFormattor:(NSString *)dateFormatter;

/*! 字符串对象转格式字符串 */
+ (NSString *)sm_stringForString:(NSString *)dateStr dateFormattor:(NSString *)dateFormatter;

/*! 获取几天前的时间字符串 */
+ (NSString *)sm_stringFewDaysAgoForDate:(NSDate *)date count:(NSInteger)count dateFormattor:(NSString *)dateFormatter;

@end

NS_ASSUME_NONNULL_END
