//
//  MRC.m
//  iOSAnimation
//
//  Created by may on 2020/9/17.
//  Copyright © 2020 may. All rights reserved.
//

#import "MRC.h"
#import "MRCTEST.h"
#import <objc/runtime.h>
#import <objc/message.h>

#import "ARC.h"

@implementation MRC
//
//+ (void)load {
//    NSLog(@"进程启动调用");
//}
//
//+ (void)initialize {
//    NSLog(@"第一次收到消息");
//}



- (instancetype)init {
    if (self = [super init]) {
        [ARC new];
//        [self test];
    }
    return self;
}



- (void)test {
    
//    CFBridgingRetain(<#id  _Nullable X#>)
//    CFBridgingRelease(<#CFTypeRef  _Nullable X#>)
    
    
//    NSError *error = nil;
//    NSError **perror = &error;
//
////    _objc_autoreleasePoolPrint();
//
//    IMP imp = [self.class methodForSelector:@selector(test)];
//    IMP imp1 = [self.class instanceMethodForSelector:@selector(test)];
//
//    id obj = [MRCTEST object];
//    [obj release]; // crush
}

+ (void)test {
    
}

@end
