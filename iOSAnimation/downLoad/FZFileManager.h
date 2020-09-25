//
//  FZFileManager.h
//  iOSAnimation
//
//  Created by may on 2020/7/24.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZFileManager : NSObject

/// 文件存在
+ (BOOL)fileExist:(NSString *)filePath;

/// 移除文件
+ (void)removeFile:(NSString *)filePath;

/// 移动文件
+ (void)moveFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath;

/// 文件大小
+ (long long)fileLength:(NSString *)filePath;

/// cache文件路径
+ (NSString *)cacheFilePathWithName:(NSString *)name;

/// tmp文件路径
+ (NSString *)tempFilePathWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
