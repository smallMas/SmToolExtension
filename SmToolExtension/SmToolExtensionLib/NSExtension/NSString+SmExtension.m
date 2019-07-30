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

#pragma mark - json转换
- (id)sm_toJsonObject {
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
}

#pragma mark - 计算文本长度
- (CGFloat)sm_calculateWidthWithFont:(UIFont *)font size:(CGSize)size {
    CGRect rect = [self sm_calculateRectWithFont:font size:size];
    return ceil(rect.size.width);
}

- (CGFloat)sm_calculateHeightWithFont:(UIFont *)font size:(CGSize)size {
    CGRect rect = [self sm_calculateRectWithFont:font size:size];
    return ceil(rect.size.height);
}

- (CGRect)sm_calculateRectWithFont:(UIFont *)font size:(CGSize)size {
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil];
    return rect;
}

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

#pragma mark - 字符串查找
- (NSArray *)sm_findSubString:(NSString *)subStr {
    if (!subStr) {
        return nil;
    }
    
    NSMutableArray *testArray = [[NSMutableArray alloc] initWithCapacity:20];
    int count = (int)[[self componentsSeparatedByString:subStr] count]-1;
    NSString *testStr = self;
    
    /*解析:录入数组*/
    for (int i=0; i<count; i++) {
        NSRange tempRange = [testStr rangeOfString:subStr];
        [testArray addObject:[NSValue valueWithRange:tempRange]];
        if (i!=count-1) {
            tempRange.location = tempRange.location + tempRange.length;
            tempRange.length = testStr.length - subStr.length;
            testStr = [testStr substringFromIndex:tempRange.location];
        }
    }
    
    NSMutableArray* requestArray=[[NSMutableArray alloc]initWithCapacity:20];
    /*反向解析*/
    for (int i=0; i<count; i++) {
        NSValue* value=[testArray objectAtIndex:i];
        NSRange tempRange=value.rangeValue;
        for (int j=0; j<i; j++) {
            NSValue* jvalue=[testArray objectAtIndex:j];
            NSRange jRange=jvalue.rangeValue;
            tempRange.location+=jRange.location+subStr.length;
        }
        [requestArray addObject:[NSValue valueWithRange:tempRange]];
    }
    return requestArray;
}

- (NSRange)sm_findLastSubString:(NSString *)subStr {
    NSArray *arr = [self sm_findSubString:subStr];
    if (arr == nil || arr.count == 0) {
        return NSMakeRange(0, 0);
    }else {
        NSValue *value = arr.lastObject;
        NSRange range;
        [value getValue:&range];
        return range;
    }
}

- (NSArray *)sm_subStringFrom:(NSString *)startString to:(NSString *)endString {
    NSArray *array = [self componentsSeparatedByString:startString];
    NSMutableArray *resultArr = [[NSMutableArray alloc]init];
    for (NSString *str in array) {
        NSArray *arr = [str componentsSeparatedByString:endString];
        if ([arr lastObject]) {
            [resultArr addObject:[arr lastObject]];
        }
    }
    return resultArr;
}

@end
