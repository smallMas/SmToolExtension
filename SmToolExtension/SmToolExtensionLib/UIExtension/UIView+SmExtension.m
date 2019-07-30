//
//  UIView+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "UIView+SmExtension.h"

@implementation UIView (SmExtension)

#pragma mark - 圆角/边线
- (void)sm_setRoundRadius:(float)radius borderColor:(UIColor *)bColor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [bColor CGColor];
}

- (void)sm_setRoundRadius:(float)radius borderColor:(UIColor *)bColor board:(CGFloat)board {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = board;
    self.layer.borderColor = [bColor CGColor];
}

- (void)sm_setResterizeRoundRadius:(float)radius borderColor:(UIColor *)bColor {
    [self sm_setRoundRadius:radius borderColor:bColor];
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)sm_setCorner:(UIRectCorner)corners radius:(float)radius {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corners
                                           cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (UIView *)sm_borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(SmBorderSideType)borderType {
    if (borderType == SmBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    
    /// left
    if (borderType & SmBorderSideTypeLeft) {
        /// left线路径
        [self.layer addSublayer:[self sm_addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// right
    if (borderType & SmBorderSideTypeRight) {
        /// right线路径
        [self.layer addSublayer:[self sm_addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// top
    if (borderType & SmBorderSideTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self sm_addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
    }
    
    /// bottom
    if (borderType & SmBorderSideTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self sm_addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    return self;
}

- (CAShapeLayer *)sm_addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}

#pragma mark - 基础方法
- (void)setSm_x:(CGFloat)sm_x {
    CGRect frame = self.frame;
    frame.origin.x = sm_x;
    self.frame = frame;
}

- (CGFloat)sm_x {
    return self.frame.origin.x;
}

- (void)setSm_y:(CGFloat)sm_y {
    CGRect frame = self.frame;
    frame.origin.y = sm_y;
    self.frame = frame;
}

- (CGFloat)sm_y {
    return self.frame.origin.y;
}

- (void)setSm_w:(CGFloat)sm_w {
    CGRect frame = self.frame;
    frame.size.width = sm_w;
    self.frame = frame;
}

- (CGFloat)sm_w {
    return self.frame.size.width;
}

- (void)setSm_h:(CGFloat)sm_h {
    CGRect frame = self.frame;
    frame.size.height = sm_h;
    self.frame = frame;
}

- (CGFloat)sm_h {
    return self.frame.size.height;
}

- (void)setSm_size:(CGSize)sm_size {
    CGRect frame = self.frame;
    frame.size = sm_size;
    self.frame = frame;
}

- (CGSize)sm_size {
    return self.frame.size;
}

- (void)setSm_origin:(CGPoint)sm_origin {
    CGRect frame = self.frame;
    frame.origin = sm_origin;
    self.frame = frame;
}

- (CGPoint)sm_origin {
    return self.frame.origin;
}

#pragma mark - 渐变layer
- (CAGradientLayer *)sm_createGradientStartColor:(UIColor *)color1 endColor:(UIColor *)color2 {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[(id)color1.CGColor,
                             (id)color2.CGColor];
    // 根据起点指向终点的方向来渐变颜色,范围是0～1
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    return gradientLayer;
}

- (void)sm_addGradientStartColor:(UIColor *)color1 endColor:(UIColor *)color2 {
    CAGradientLayer *layer = [self sm_createGradientStartColor:color1 endColor:color2];
    [self.layer addSublayer:layer];
}

@end
