//
//  mutableParams.h
//  iOSAnimation
//
//  Created by may on 2020/9/28.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface mutableParams : NSObject

- (void)foo:(NSString *)str, ... NS_REQUIRES_NIL_TERMINATION ;

@end

NS_ASSUME_NONNULL_END
