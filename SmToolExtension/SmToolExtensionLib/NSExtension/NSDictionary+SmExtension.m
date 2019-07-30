//
//  NSDictionary+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import "NSDictionary+SmExtension.h"

@implementation NSDictionary (SmExtension)

- (NSString *)sm_toJsonString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
