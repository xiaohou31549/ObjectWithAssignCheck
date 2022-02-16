//
//  MEObjectAssignCheck.h
//  ME
//
//  Created by tough on 2022/1/19.
//  Copyright © 2022 developer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectWithAssignCheck : NSObject

+ (void)checkWithClassPrefixes:(NSArray<NSString *> *)prefixes;

@end

NS_ASSUME_NONNULL_END
