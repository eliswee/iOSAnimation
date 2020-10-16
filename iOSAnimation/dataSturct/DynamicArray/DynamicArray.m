//
//  DynamicArray.m
//  iOSAnimation
//
//  Created by may on 2020/9/25.
//  Copyright © 2020 may. All rights reserved.
//

#import "DynamicArray.h"

const int DEFAULTCAPACITY = 10;
const int ELEMENTNOTFOND = -1;

@interface DynamicArray ()

@property (nonatomic, assign) int size;
@property (nonatomic, assign) int *container;
@property (nonatomic, assign) int capacity;

@end

@implementation DynamicArray

- (void)dealloc {
    free(_container);
}

- (instancetype)init {
    return  [self initWitCapacity:DEFAULTCAPACITY];
}

- (instancetype)initWitCapacity:(int)capacity {
    if (self = [super init]) {
        if (capacity <= 0) {
            capacity = DEFAULTCAPACITY;
        }
        self.capacity = capacity;
        self.container = calloc(capacity, [self itemSize]);
    }
    return self;
}

#pragma mark - privateMethods

- (int)itemSize {
    return sizeof(int);
}

- (void)resizeTo:(int)capacity {
    
    if (capacity < DEFAULTCAPACITY) {
        capacity = DEFAULTCAPACITY;
    }
    
    int *temp = calloc(capacity, [self itemSize]);
    
    for (int i = 0; i < self.size; i++) {
        temp[i] = self.container[i];
    }
    
    free(self.container);
    
    self.container = temp;
    self.capacity = capacity;
}

- (void)ensureCapacity {
    NSLog(@"checkSize: currentCap:%d, currentSize:%d",self.capacity, self.size);
    if (self.size >= self.capacity) {
        [self resizeTo:(self.capacity << 1)]; // 扩容一倍
        NSLog(@"resizeTo%d", self.capacity);
    }
}

- (void)trime {
    NSLog(@"checkSize: currentCap:%d, currentSize:%d",self.capacity, self.size);
    if (self.size <= self.capacity>>2) { // 1/4缩容， 扩容倍数和缩容倍数乘积为1会导致复杂度震荡
        [self resizeTo:self.capacity>>1];
        NSLog(@"resizeTo%d", self.capacity);
    }
}

- (void)checkIndex:(int)index {
    if (index >= self.size) {
        NSAssert(NO, @"error: index over size");
    }
}

#pragma mark - publicMethods

- (int)size {
    return _size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)add:(int)item {
    [self ensureCapacity];
    self.container[self.size] = item;
    self.size++;
}

- (void)add:(int)item toIndex:(int)index {
    [self checkIndex:index];
    [self ensureCapacity];
    for (int i = self.size; i > index; i--) {
        self.container[i] = self.container[i-1];
    }
    self.container[index] = item;
    self.size++;
}

- (BOOL)contains:(int)item {
    BOOL contains = NO;
    for(int i = 0; i < self.size; i++) {
        if (self.container[i] == item) {
            contains = YES;
            break;
        }
    }
    return contains;
}

- (int)get:(int)index {
    [self checkIndex:index];
    return self.container[index];
}

- (int)set:(int)index item:(int)item {
    [self checkIndex:index];
    int temp = self.container[index];
    self.container[index] = item;
    return temp;
}

- (void)remove:(int)index {
    [self checkIndex:index];
    for (int i = index; i < self.size; i++) {
        self.container[i] = self.container[i + 1];
    }
    self.size--;
    [self trime];
}

- (int)indexOf:(int)item {
    [self checkIndex:index];
    for (int i = 0; i < self.size; i++) {
        if (self.container[i] == item) {
            return i;
        }
    }
    return ELEMENTNOTFOND;
}

- (void)clear {
    memset(_container, 0, self.size);
    if (self.capacity != DEFAULTCAPACITY) {
        [self resizeTo:DEFAULTCAPACITY];
    }
    self.size = 0;
}

@end
