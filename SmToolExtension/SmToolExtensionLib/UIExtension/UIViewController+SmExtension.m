//
//  UIViewController+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "UIViewController+SmExtension.h"

@implementation UIViewController (SmExtension)

#pragma mark - Controller 生成
- (void)sm_pushControllerWithClassString:(NSString *)classString {
    UIViewController *obj = [self sm_createControllerWithClassString:classString];
    if ([obj isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (void)sm_pushControllerWithClassString:(NSString *)classString params:(NSDictionary *)params {
    UIViewController *obj = [self sm_createControllerWithClassString:classString];
    for (NSString *key in params) {
        [obj setValue:params[key] forKey:key];
    }
    if ([obj isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:obj animated:YES];
    }
}

- (UIViewController *)sm_createControllerWithClassString:(NSString *)classString {
    Class cls = NSClassFromString(classString);
    UIViewController *obj = [cls new];
    return obj;
}

#pragma mark - tabbar按钮生成
- (UITabBarItem *)sm_createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage tag:0];
    return item;
}

- (UITabBarItem *)sm_createTabbarItemTitle:(NSString *)title ForImage:(UIImage *)image ForSelectImage:(UIImage *)sImage {
    UIImage *oImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *osImage = [sImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:oImage selectedImage:osImage];
    return item;
}


@end
