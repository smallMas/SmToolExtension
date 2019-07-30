//
//  UIButton+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SmExtension)

#pragma mark - 快捷方式创建
+ (UIButton *)sm_createWithType:(UIButtonType)type target:(id)target action:(SEL)action;

#pragma mark - 图文显示
/*
 * 图片居左，文字在右，垂直居中显示，文字与图片没有间距为10
 */
- (void)sm_setIconInLeftWithSpacing:(CGFloat)Spacing;

/*
 * 图片居右，文字在左，垂直居中显示，文字与图片没有间距为10
 */
- (void)sm_setIconInRightWithSpacing:(CGFloat)Spacing;

/*
 * 图片居上，文字在下，垂直居中显示，文字与图片没有间距为10
 */
- (void)sm_setIconInTopWithSpacing:(CGFloat)Spacing;

/*
 * 图片居下，文字在上，垂直居中显示，文字与图片没有间距为10
 */
- (void)sm_setIconInBottomWithSpacing:(CGFloat)Spacing;

@end

NS_ASSUME_NONNULL_END
