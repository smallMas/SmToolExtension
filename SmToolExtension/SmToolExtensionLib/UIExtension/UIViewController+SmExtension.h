//
//  UIViewController+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SmExtension)

#pragma mark - Controller 生成
/*! 使用类字符串push Controller */
- (void)sm_pushControllerWithClassString:(NSString *)classString;
/*! 使用类字符串push Controller 带参数[] */
- (void)sm_pushControllerWithClassString:(NSString *)classString params:(NSDictionary *)params;
/*！使用类字符串生成类对象 */
- (UIViewController *)sm_createControllerWithClassString:(NSString *)classString;

#pragma mark - tabbar按钮生成
/*! title image生成tabbaritem */
- (UITabBarItem *)sm_createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image;
/*! title image sImage生成tabbaritem */
- (UITabBarItem *)sm_createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage;

@end

NS_ASSUME_NONNULL_END
