//
//  NSString+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/29.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SmExtension)

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

@end

NS_ASSUME_NONNULL_END
