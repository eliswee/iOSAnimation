//
//  MRCTEST.m
//  iOSAnimation
//
//  Created by may on 2020/9/17.
//  Copyright © 2020 may. All rights reserved.
//

#import "MRCTEST.h"

@implementation MRCTEST

- (void)dealloc {
    NSLog(@"---");
}

+ (instancetype)object {
    id obj = [[MRCTEST alloc] init];
    [obj autorelease];
    return obj;
}

@end
