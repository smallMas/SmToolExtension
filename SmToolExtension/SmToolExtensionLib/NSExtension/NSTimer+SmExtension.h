//
//  NSTimer+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (SmExtension)

/*!
 * 定时器快捷方式 (解决不释放的问题)
 *
 * @param inerval 时间
 * @param repeats 重复
 * @param block 定时器回调
 */
+ (NSTimer *)sm_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
