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
- (NSString *)Sm_MD5_16;

/*!
 *  获取字符串的MD5编码 32位
 *
 *  @return MD5编码
 */
- (NSString *)Sm_MD5_32;

@end

NS_ASSUME_NONNULL_END
