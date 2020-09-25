//
//  FZSQLiteTool.m
//  iOSAnimation
//
//  Created by may on 2020/9/14.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZSQLiteTool.h"
#import <sqlite3.h>

static sqlite3 *_db;

@implementation FZSQLiteTool

+ (BOOL)dealSql:(NSString *)sql uid:(NSString *)uid {
    
    [self openDB:uid];
    
    char *errorMsg = NULL;
    
    BOOL result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMsg) == SQLITE_OK;
    
    [self closeDB];
    
    if (result || errorMsg) {
        return NO;
    }
    return YES;
}

+ (NSArray<NSDictionary *> *)queaySql:(NSString *)sql uid:(NSString *)uid {
    
    [self openDB:uid];
    
    sqlite3_stmt *stmt;
    
    if (sqlite3_prepare(_db, sql.UTF8String, -1, &stmt, nil) != SQLITE_OK) {
        NSLog(@"SQL准备失败");
        sqlite3_finalize(stmt);
        [self closeDB];
        return nil;
    }
    
    NSMutableArray *rowDicArray = [NSMutableArray arrayWithCapacity:0];
    
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        int columnCount = sqlite3_column_count(stmt);
        
        NSMutableDictionary *rowDic = [NSMutableDictionary dictionary];
        
        [rowDicArray addObject:rowDic];
        
        for (int i = 0; i < columnCount; i++) {
            NSString *columnName = [NSString stringWithUTF8String:sqlite3_column_name(stmt, i)];
            
            int type = sqlite3_column_type(stmt, i);
            
            id value;
            
            switch (type) {
                case SQLITE_INTEGER:
                    value = @(sqlite3_column_int(stmt, i));
                    break;
                case SQLITE_FLOAT:
                    value = @(sqlite3_column_double(stmt, i));
                    break;
                case SQLITE_BLOB:
                    value = CFBridgingRelease(sqlite3_column_blob(stmt, i));
                    break;
                case SQLITE3_TEXT:
                    value = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, i)];
                    break;
                case SQLITE_NULL:
                    value = [NSNull null];
                    break;
                default:
                    break;
            }
            
            [rowDic setValue:value forKey:columnName];
        }
    }
    sqlite3_finalize(stmt);
    [self closeDB];
    return [rowDicArray copy];
}

+ (void)openDB:(NSString *)uid {
    
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *dbName = [NSString stringWithFormat:@"%@.sqlite", uid.length ? uid : @"common"];
    
    NSString *dbPath = [cachePath stringByAppendingPathComponent:dbName];

    int result = sqlite3_open(dbPath.UTF8String, &_db);
    
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库");
    }
    else {
        // 打开失败
        NSLog(@"数据库打开失败");
        [self closeDB];
    }
}

+ (void)closeDB {
    sqlite3_close(_db);
}

@end
