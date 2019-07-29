//
//  NSString+SmExtension.m
//  SmToolExtension
//
//  Created by love on 2019/7/29.
//  Copyright © 2019 love. All rights reserved.
//

#import "NSString+SmExtension.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (SmExtension)

#pragma mark - 加密
- (NSString *)sm_MD5_16 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X",
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11]
             ] lowercaseString];
}

- (NSString *)sm_MD5_32 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

#pragma mark - 校验
- (BOOL)sm_checkWithPredicate:(NSString *)preStr {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", preStr];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL)sm_isEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    return [self sm_checkWithPredicate:regex];
}

- (BOOL)sm_isMobilePhone {
    NSString *regex = @"^1[0-9][0-9]\\d{8}";
    
    return [self sm_checkWithPredicate:regex];
}

- (BOOL)sm_isHttp {
    if ([self containsString:@"http"]) {
        return YES;
    }
    return NO;
}

@end
