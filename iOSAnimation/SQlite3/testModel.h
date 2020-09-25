//
//  testModel.h
//  iOSAnimation
//
//  Created by may on 2020/9/14.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface testModel : NSObject {
    int b;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL bot;
@property (nonatomic, assign) double scoure;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int age2;

@end

NS_ASSUME_NONNULL_END
