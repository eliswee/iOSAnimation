//
//  LinkedList.h
//  iOSAnimation
//
//  Created by may on 2020/11/13.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkedList : NSObject

- (int)getSize;

- (BOOL)isEmpty;

- (void)addFirst:(int)data;

- (void)addLast:(int)data;

- (void)add:(int)data toIndex:(int)index;

- (void)remove:(int)data;

- (void)removeAll:(int)data;

- (void)removeIndex:(int)index;

- (void)removeFirst;

- (void)removeLast;

@end

NS_ASSUME_NONNULL_END
