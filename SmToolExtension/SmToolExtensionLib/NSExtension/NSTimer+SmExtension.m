//
//  NSTimer+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "NSTimer+SmExtension.h"

@implementation NSTimer (SmExtension)

+ (NSTimer *)sm_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(vm_blcokInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)vm_blcokInvoke:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end

