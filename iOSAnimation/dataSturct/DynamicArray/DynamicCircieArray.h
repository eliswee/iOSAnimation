//
//  DynamicCircieArray.h
//  iOSAnimation
//
//  Created by may on 2020/10/15.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicArray.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicCircieArray : DynamicArray

- (int)size;

- (BOOL)isEmpty;

- (BOOL)contains:(int)item;

- (void)add:(int)item;

- (void)add:(int)item toIndex:(int)index;

- (int)get:(int)index;

- (int)set:(int)index item:(int)item;

- (void)remove:(int)index;

- (int)indexOf:(int)item;

- (void)clear;

@end

NS_ASSUME_NONNULL_END
