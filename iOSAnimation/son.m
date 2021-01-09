//
//  son.m
//  iOSAnimation
//
//  Created by may on 2021/1/4.
//  Copyright © 2021 may. All rights reserved.
//

#import "son.h"

@interface son() {
}

@end

@implementation son

//@dynamic name;

@synthesize name = _name;

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

//- (NSString *)description {
////    return [NSString stringWithFormat:@"%@", _name];
//}

@end
