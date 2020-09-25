//
//  FZSQLiteTool.h
//  iOSAnimation
//
//  Created by may on 2020/9/14.
//  Copyright © 2020 may. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZSQLiteTool : NSObject

+ (BOOL)dealSql:(NSString *)sql uid:( NSString * _Nullable )uid;

+ (NSArray <NSDictionary *>*)queaySql:(NSString *)sql uid:( NSString * _Nullable )uid;

@end

NS_ASSUME_NONNULL_END
