//
//  UILabel+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "UILabel+SmExtension.h"

@implementation UILabel (SmExtension)

#pragma mark - 快捷创建方法
+ (UILabel *)sm_createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.textColor = color;
    return label;
}

+ (UILabel *)sm_createFrame:(CGRect)frame font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    UILabel *label = [self sm_createFrame:frame font:font color:color];
    label.textAlignment = alignment;
    return label;
}

+ (UILabel *)sm_createFont:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    return label;
}

+ (UILabel *)sm_createFont:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment {
    UILabel *label = [self sm_createFont:font color:color];
    label.textAlignment = alignment;
    return label;
}

@end
