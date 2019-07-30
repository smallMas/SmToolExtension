//
//  UIView+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SmBorderSideType) {
    SmBorderSideTypeAll  = 0,
    SmBorderSideTypeTop = 1 << 0,
    SmBorderSideTypeBottom = 1 << 1,
    SmBorderSideTypeLeft = 1 << 2,
    SmBorderSideTypeRight = 1 << 3,
};

@interface UIView (SmExtension)

#pragma mark - 圆角/边线
/*! layer设置圆角 */
- (void)sm_setRoundRadius:(float)radius borderColor:(UIColor *)bColor;
- (void)sm_setRoundRadius:(float)radius borderColor:(UIColor *)bColor board:(CGFloat)board;
- (void)sm_setResterizeRoundRadius:(float)radius borderColor:(UIColor *)bColor;

/*! 设置圆角 左右四个角都可以单独或组合设置 (确定好view的frame才可使用) */
- (void)sm_setCorner:(UIRectCorner)corners radius:(float)radius;

/*! 部分边框线 */
- (UIView *)sm_borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(SmBorderSideType)borderType;

#pragma mark - 基础方法
- (void)setSm_x:(CGFloat)sm_x;
- (CGFloat)sm_x;
- (void)setSm_y:(CGFloat)sm_y;
- (CGFloat)sm_y;
- (void)setSm_w:(CGFloat)sm_w;
- (CGFloat)sm_w;
- (void)setSm_h:(CGFloat)sm_h;
- (CGFloat)sm_h;
- (void)setSm_size:(CGSize)sm_size;
- (CGSize)sm_size;
- (void)setSm_origin:(CGPoint)sm_origin;
- (CGPoint)sm_origin;

#pragma mark - layer
// 添加 渐变层
- (CAGradientLayer *)sm_createGradientStartColor:(UIColor *)color1 endColor:(UIColor *)color2;
- (void)sm_addGradientStartColor:(UIColor *)color1 endColor:(UIColor *)color2;

@end

NS_ASSUME_NONNULL_END
