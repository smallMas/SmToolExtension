//
//  NSString+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/29.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SmExtension)

#pragma mark - json转换
/*!
 * 字符串转json对象 dictionary/array
 */
- (id)sm_toJsonObject;

#pragma mark - 计算文本长度
/*!
 * 计算文本宽度
 *
 * @param font 字体
 * @param size size
 */
- (CGFloat)sm_calculateWidthWithFont:(UIFont *)font size:(CGSize)size;

/*!
 * 计算高度
 *
 * @param font 字体
 * @param size size
 */
- (CGFloat)sm_calculateHeightWithFont:(UIFont *)font size:(CGSize)size;

/*!
 * 计算文本rect
 *
 * @param font 字体
 * @param size size
 */
- (CGRect)sm_calculateRectWithFont:(UIFont *)font size:(CGSize)size;

#pragma mark - 加密
/*!
 *  获取字符串的MD5编码 16位
 *
 *  @return MD5编码
 */
- (NSString *)sm_MD5_16;

/*!
 *  获取字符串的MD5编码 32位
 *
 *  @return MD5编码
 */
- (NSString *)sm_MD5_32;

#pragma mark - 校验

/*!
 *  使用正则表达式校验字符串
 *
 *  @return 使用正则表达式，校验是否通过
 */
- (BOOL)sm_checkWithPredicate:(NSString *)preStr;

/*!
 *  判断是否是email
 *
 *  @return 是否是email
 */
- (BOOL)sm_isEmail;

/*!
 *  判断是否是手机号
 *
 *  @return 是否是手机号
 */
- (BOOL)sm_isMobilePhone;

/*!
 *  判断是否http链接
 *
 * @return 是否是http链接
 */
- (BOOL)sm_isHttp;

#pragma mark - 字符串查找
/*!
 * 查找关键字所有位置
 *
 * @param subStr 查找的关键字
 */
- (NSArray *)sm_findSubString:(NSString *)subStr;

/*!
 * 查找关键字最后一个位置
 *
 * @param subStr 查找的关键字
 */
- (NSRange)sm_findLastSubString:(NSString *)subStr;

/*! 截取字符串方法封装 */
- (NSArray *)sm_subStringFrom:(NSString *)startString to:(NSString *)endString;


@end

NS_ASSUME_NONNULL_END
