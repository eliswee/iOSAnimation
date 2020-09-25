//
//  FZSQLite3Test.m
//  iOSAnimation
//
//  Created by may on 2020/9/14.
//  Copyright © 2020 may. All rights reserved.
//

#import "FZSQLite3Test.h"
#import <sqlite3.h>
#import "testModel.h"
#import <objc/runtime.h>
#import "FZSQLiteTool.h"

@implementation FZSQLite3Test

- (instancetype)init {
    if (self = [super init]) {
        [self doTest];
    }
    return self;
}

- (void)doTest {
    
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject);
    
//    NSString *createSQL = @"create table if not exists t_test(id integer primary key autoincrement, name text not null, score real default 0)";
//
//    [FZSQLiteTool dealSql:createSQL uid:nil];
  
//    NSString *sql = @"insert into t_test(score, name) values (100.0, 'may')";
    
    NSString *sql = @"select id, name, score, from t_test";
    
    sqlite3_stmt *stmt;
    
    int result = 
    
    [FZSQLiteTool dealSql:sql uid:nil];
    
//    [self getIvarList];
    
}

- (NSDictionary *)getIvarList {
    
//    Ivar *ivarList = class_copyIvarList(testModel.class, <#unsigned int * _Nullable outCount#>)
    
    
    return nil;
}

@end
