//
//  ARC.m
//  iOSAnimation
//
//  Created by may on 2020/9/21.
//  Copyright © 2020 may. All rights reserved.
//

#import "ARC.h"
#import <objc/runtime.h>
#import "MRCTEST.h"

@implementation ARC

- (instancetype)init {
    if (self = [super init]) {
        [self test];
    }
    return self;
}

- (void)test {
    
//    CFBridgingRetain(<#id  _Nullable X#>)
//    CFBridgingRelease(<#CFTypeRef  _Nullable X#>)
//    CFShow(<#CFTypeRef obj#>)
//    CFGetRetainCount(<#CFTypeRef cf#>)
//    CFRetain(<#CFTypeRef cf#>)
//    CFRelease(<#CFTypeRef cf#>)
    //
    @autoreleasepool {
        __unused NSUInteger ite = [[NSObject new] hash];
        __unused id __autoreleasing obj = [NSObject new];
        
//        _objc_rootRetainCount(obj);
        
    }
    
    
    
    void *p = (__bridge_retained void *)[[MRCTEST alloc] init];
     NSLog(@"%@", [(__bridge id)p class]);
    (void)(__bridge_transfer id)p;
}

@end
