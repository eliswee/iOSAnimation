//
//  Stack.h
//  iOSAnimation
//
//  Created by may on 2020/11/13.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Stack <NSObject>

- (int)getSize;

- (BOOL)isEmpty;

- (void)push:(int)item;

- (int)pop;

- (int)peek;

@end

NS_ASSUME_NONNULL_END
