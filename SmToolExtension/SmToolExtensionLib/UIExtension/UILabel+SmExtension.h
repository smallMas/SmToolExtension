//
//  UILabel+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (SmExtension)

#pragma mark - 快捷创建方法
+ (UILabel *)sm_createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color;
+ (UILabel *)sm_createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;
+ (UILabel *)sm_createFont:(UIFont *)font color:(UIColor *)color;
+ (UILabel *)sm_createFont:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
