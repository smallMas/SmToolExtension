//
//  NSDictionary+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SmExtension)

/*!
 * dictionary转json字符串
 **/
- (NSString *)sm_toJsonString;

@end

NS_ASSUME_NONNULL_END
