//
//  NSObject+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "NSObject+SmExtension.h"
#import <objc/runtime.h>

@implementation NSObject (SmExtension)

#pragma mark - 归档
- (void)sm_decode:(NSCoder *)aDecoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [aDecoder decodeObjectForKey:key];
        if (value) [self setValue:value forKey:key];
    }
    free(ivars);
}

- (void)sm_encode:(NSCoder *)aCoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

@end
