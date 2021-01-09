//
//  Node.m
//  iOSAnimation
//
//  Created by may on 2020/11/13.
//  Copyright © 2020 may. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithData:(int)data next:(Node *)next {
    if (self = [super init]) {
        _data = data;
        _next = next;
    }
    return self;;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%d", self.data];
}

@end
