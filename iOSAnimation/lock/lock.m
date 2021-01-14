//
//  lock.m
//  iOSAnimation
//
//  Created by May on 2021/1/14.
//  Copyright © 2021 may. All rights reserved.
//

#import "lock.h"
#import <pthread.h>

@interface lock()

@property (nonatomic, assign) pthread_mutex_t lock;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, assign) pthread_mutexattr_t attr;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, assign) pthread_rwlock_t rwLock;

@end

@implementation lock

- (void)dealloc {
    pthread_mutexattr_destroy(&_attr);
    pthread_cond_destroy(&_cond);
    pthread_mutex_destroy(&_lock);
}


- (instancetype)init {
    if (self = [super init]) {
//        [self testLock];
        [self testRWLock];
    }
    return self;
}

- (void)testRWLock {
    pthread_rwlock_init(&_rwLock, NULL);
    
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(read) object:nil] start];
        [[[NSThread alloc] initWithTarget:self selector:@selector(write) object:nil] start];
    }
    
}

- (void)read {
    static int a = 0;
    pthread_rwlock_rdlock(&_rwLock);
    NSLog(@"开始读_%d", a);
    sleep(1.f);
    NSLog(@"读完成_%d", a);
    pthread_rwlock_unlock(&_rwLock);
    a++;
}

- (void)write {
    static int a = 0;
    pthread_rwlock_wrlock(&_rwLock);
    NSLog(@"开始写_%d", a);
    sleep(1.f);
    NSLog(@"写完成_%d", a);
    pthread_rwlock_unlock(&_rwLock);
    a++;
}

- (void)testLock {
    // 创建自旋锁
//    pthread_mutex_t lock;
//    pthread_mutexattr_init(&_attr);
//    pthread_mutexattr_settype(&_attr, PTHREAD_MUTEX_RECURSIVE);
//    pthread_mutex_init(&lock, &_attr);
    
    pthread_mutex_init(&_lock, NULL);
    pthread_cond_init(&_cond, NULL);
    
    NSThread *s1;
    NSThread *s2;
    
    // remove
    __weak typeof(self) ws = self;
    s1 = [[NSThread alloc] initWithBlock:^{
        __strong typeof(self) ss = ws;
        pthread_mutex_lock(&(ss->_lock));
        pthread_cond_wait(&ss->_cond, &(ss->_lock));
        NSLog(@"start remove");
        [self.arr removeObjectAtIndex:0];
        NSLog(@"end remove");
        pthread_mutex_unlock(&(ss->_lock));
    }];
    
    // add
    s2 = [[NSThread alloc] initWithBlock:^{
        __strong typeof(self) ss = ws;
        pthread_mutex_lock(&ss->_lock);
        NSLog(@"start add");
        [self.arr addObject:@"123"];
        NSLog(@"end add");
        pthread_cond_signal(&ss->_cond);
        NSLog(@"发送信号");
        pthread_mutex_unlock(&ss->_lock);
        NSLog(@"解锁");
    }];
    
    [s1 start];
    [s2 start];
}


@end
