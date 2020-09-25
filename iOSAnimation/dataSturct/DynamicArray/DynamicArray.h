//
//  DynamicArray.h
//  iOSAnimation
//
//  Created by may on 2020/9/25.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicArray : NSObject

// for int -> for object

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
