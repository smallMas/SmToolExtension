//
//  UIColor+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SmExtension)

/*! 16进制生成Color对象 */
+ (UIColor *)sm_colorWithHexString:(NSString *)hexString;
/* !16进制、alpha 生成Color对象*/
+ (UIColor *)sm_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/*! 随机颜色 */
+ (UIColor *)sm_randomColor;

@end

NS_ASSUME_NONNULL_END
