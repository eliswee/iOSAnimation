//
//  Node.h
//  iOSAnimation
//
//  Created by may on 2020/11/13.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (nonatomic, strong) Node * _Nullable next;
@property (nonatomic, assign) int data;

- (instancetype)initWithData:(int)data next:(Node *)next;

@end

NS_ASSUME_NONNULL_END
