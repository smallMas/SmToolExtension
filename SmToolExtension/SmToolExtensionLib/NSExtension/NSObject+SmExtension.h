//
//  NSObject+SmExtension.h
//  SmToolExtension
//
//  Created by love on 2019/7/30.
//  Copyright © 2019 love. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SmExtension)

#pragma mark - 归档
/*!
 * 序列化,解档
 *
 * @param aDecoder coder
 */
- (void)sm_decode:(NSCoder *)aDecoder;

/*!
 * 序列化,归档
 *
 * @param aCoder coder
 */
- (void)sm_encode:(NSCoder *)aCoder;

@end

NS_ASSUME_NONNULL_END
