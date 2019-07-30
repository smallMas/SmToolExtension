//
//  NSArray+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SmPinYinModel;
@interface NSArray (SmExtension)

/*!
 * array转json字符串
 **/
- (NSString *)sm_toJsonString;

/*!
 * @brief 按拼音首字母分类
 *
 * @param key model的属性名
 */
- (NSArray *)sm_arrayWithPinYinFirstCharWithKey:(NSString *)key;

@end


@interface SmPinYinModel : NSObject

// 首字母
@property (nonatomic, strong) NSString *firstLetter;

// 数组
@property (nonatomic, strong) NSArray *array;

/*!
 * 快捷方式
 *
 * @param first 首字母
 * @param array 数组
 */
+ (SmPinYinModel *)sm_createFirst:(NSString *)first array:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
