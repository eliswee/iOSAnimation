//
//  FZFileManager.m
//  iOSAnimation
//
//  Created by may on 2020/7/24.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZFileManager.h"

@implementation FZFileManager

+ (BOOL)fileExist:(NSString *)filePath {
    if (!filePath.length) {return NO;}
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (void)removeFile:(NSString *)filePath {
    if (![self fileExist:filePath]) { return; }
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

+ (void)moveFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath {
    if (!fromPath.length || !toPath.length) {
        return;
    }
    
    if (![self fileExist:fromPath]) {
        return;
    }
    [[NSFileManager defaultManager] moveItemAtPath:fromPath toPath:toPath error:nil];
}

+ (long long)fileLength:(NSString *)filePath {
    if (![self fileExist:filePath]) {
        return 0;
    }
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    return [attributes[NSFileSize] longLongValue];
}

+ (NSString *)cacheFilePathWithName:(NSString *)name {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, NO).firstObject;
    NSString *res = [cachePath stringByAppendingPathComponent:name];
    NSLog(@"☁️CachePath:%@", res);
    return res;
}

+ (NSString *)tempFilePathWithName:(NSString *)name {
    NSString *res = [NSTemporaryDirectory() stringByAppendingPathComponent:name];
    NSLog(@"☁️tempPath:%@", res);
    return res;
}

@end
