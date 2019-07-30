//
//  UIButton+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "UIButton+SmExtension.h"

@implementation UIButton (SmExtension)

#pragma mark - 快捷方式创建
+ (UIButton *)sm_createWithType:(UIButtonType)type target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:type];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - 图文显示
- (void)sm_setIconInLeftWithSpacing:(CGFloat)spacing {
    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
}

- (void)sm_setIconInRightWithSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - (img_W + spacing / 2), 0, (img_W + spacing / 2));
    self.imageEdgeInsets = UIEdgeInsetsMake(0, (tit_W + spacing / 2), 0, - (tit_W + spacing / 2));
}

- (void)sm_setIconInTopWithSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = UIEdgeInsetsMake((tit_H / 2 + spacing / 2), - (img_W / 2), - (tit_H / 2 + spacing / 2), (img_W / 2));
    self.imageEdgeInsets = UIEdgeInsetsMake(- (img_H / 2 + spacing / 2), (tit_W / 2), (img_H / 2 + spacing / 2), - (tit_W / 2));
}

- (void)sm_setIconInBottomWithSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(- (tit_H / 2 + spacing / 2), - (img_W / 2), (tit_H / 2 + spacing / 2), (img_W / 2));
    self.imageEdgeInsets = UIEdgeInsetsMake((img_H / 2 + spacing / 2), (tit_W / 2), - (img_H / 2 + spacing / 2), - (tit_W / 2));
}

@end
