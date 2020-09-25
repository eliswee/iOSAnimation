//
//  DynamicArray.m
//  iOSAnimation
//
//  Created by may on 2020/9/25.
//  Copyright © 2020 may. All rights reserved.
//

#import "DynamicArray.h"

static const int DEFAULTCAPACITY = 10;

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
    return self;;
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

#pragma mark - publicMethods

- (int)size {
    return self.size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)add:(int)item {
    self.container[self.size] = item;
    self.size++;
}

- (void)add:(int)item toIndex:(int)index {
    
}

- (BOOL)contains:(int)item {
    return NO;
}

- (int)get:(int)index {
    return 0;
}

- (int)set:(int)index item:(int)item {
    return 0;
}

- (void)remove:(int)index {
    
}

- (int)indexOf:(int)item {
    return 0;
}

- (void)clear {
    memset(_container, 0, self.size);
    self.size = 0;
}



@end
