//
//  AppDelegate.m
//  iOSAnimation
//
//  Created by may on 2019/12/27.
//  Copyright © 2019 may. All rights reserved.
//

#import "AppDelegate.h"
#import "DynamicArray.h"
#import "DynamicCircieArray.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [self dynamicCircleArrayTest];
    return YES;
}

- (void)dynamicCircleArrayTest {
    DynamicCircieArray *array = [DynamicCircieArray new];
    for (int i = 0; i < 15; i++) {
        [array add:100+i];
    }
    NSLog(@"size:%d", array.size);
    [array set:9 item:666];
    
    for (int i = 0; i < 10; i++) {
        [array add:i * 100 toIndex:9];
    }
    
    NSLog(@"%@", array);
    
    NSLog(@"%d", [array indexOf:666]);
    
//    for (int i = 0; i < array.size; i++) {
//        NSLog(@"%d", [array get:i]);
//    }
//    for (int i = 0; i < 10; i++) {
//        [array remove:1];
//    }
//    NSLog(@"size:%d", array.size);
//    for (int i = 0; i < array.size; i++) {
//        NSLog(@"%d", [array get:i]);
//    }
}

- (void)dynamicArrayTest {
    
    DynamicArray *array = [DynamicArray new];
    for (int i = 0; i < 15; i++) {
        [array add:100+i];
    }
    NSLog(@"size:%d", array.size);
    [array set:10 item:500];
    [array add:600 toIndex:10];
    for (int i = 0; i < array.size; i++) {
        NSLog(@"%d", [array get:i]);
    }
    for (int i = 0; i < 10; i++) {
        [array remove:1];
    }
    NSLog(@"size:%d", array.size);
    for (int i = 0; i < array.size; i++) {
        NSLog(@"%d", [array get:i]);
    }
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
