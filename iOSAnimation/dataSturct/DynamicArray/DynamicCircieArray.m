//
//  DynamicCircieArray.m
//  iOSAnimation
//
//  Created by may on 2020/10/15.
//  Copyright © 2020 may. All rights reserved.
//

#import "DynamicCircieArray.h"

@interface DynamicCircieArray()

@property (nonatomic, assign) int size;
@property (nonatomic, assign) int *container;
@property (nonatomic, assign) int capacity;
@property (nonatomic, assign) int front;

@property (nonatomic, assign) int tail;

@end

/** 封装取余逻辑 */

@implementation DynamicCircieArray

- (void)dealloc {
    free(self.container);
    NSLog(@"free-%p", &self);
}

- (instancetype)init {
    return [self initWithCapacity:DEFAULTCAPACITY];
}

- (instancetype)initWithCapacity:(int)capacity {
    if (self = [super init]) {
        
        if (capacity <= DEFAULTCAPACITY) {
            capacity = DEFAULTCAPACITY;
        }
        self.capacity = capacity;
        self.container = calloc(capacity, sizeof(int));
        self.size = 0;
        self.front = 0;
        self.tail = 0;
    }
    return self;
}


#pragma mark - pub

- (int)size {
    return _size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}
    
- (BOOL)contains:(int)item {
    for (int i = 0; i < self.size; i++) {
        if (self.container[i] == item) {
            return YES;
        }
    }
    return NO;
}

- (void)add:(int)item {
    [self ensureCapacity];
    self.container[handleIndex(self, self.size)] = item;
    self.size++;
}

- (void)add:(int)item toIndex:(int)index {
    if (index > self.size || index < 0) {
        NSAssert(NO, @"error: index over size");
    }
    [self ensureCapacity];
    for (int i = handleIndex(self, self.size); i > handleIndex(self, index) ; i--) {
        self.container[handleIndex(self, i)] = self.container[handleIndex(self, i) - 1];
    }
    self.container[handleIndex(self, index)] = item;
    self.size++;
}

- (int)get:(int)index {
    return self.container[handleIndex(self, index)];
}

- (int)set:(int)index item:(int)item {
    
    int temp = self.container[handleIndex(self, index)];
    self.container[handleIndex(self, index)] = item;
    
    return temp;
}

- (void)remove:(int)index {
    
//    if (index >= self.size) {
//        NSAssert(NO, @"index over size");
//        return;
//    } else if (index == 0) {
//        self.size--;
//        self.head = handleIndex(self, self.head + 1);
//    } else if (index == self.tail) {
//        self.size--;
//        self.tail = handleIndex(self, self.tail - 1);
//    } else {
//        for (int i = ; <#condition#>; <#increment#>) {
//            <#statements#>
//        }
//    }
}

- (int)indexOf:(int)item {
    for (int i = 0; i < self.size; i++) {
        if (item == self.container[handleIndex(self, i)]) {
            return handleIndex(self, i);
        }
    }
    return ELEMENTNOTFOND;
}

- (void)clear {
//    memset(self.container, 0, sizeof(int) * self.capacity);
//    self.size = 0;
//    self.head = 0;
//    if (self.capacity != DEFAULTCAPACITY) {
//        self.capacity = DEFAULTCAPACITY;
//        int *temp = calloc(DEFAULTCAPACITY, sizeof(int));
//        free(self.container);
//        self.container = temp;
//    }
}

#pragma mark - pri

static inline int handleIndex(DynamicCircieArray *self, int index) {
    
//    index += self.capacity;
//    if (index < 0) {
//
//    }
//    return (self.head + index) % self.capacity;
    return 0;
}

- (void)ensureCapacity {
    if (self.size >= self.capacity) {
        [self resizeTo:(self.capacity << 1)];
    }
}

- (void)trim {
    if (self.size <= self.capacity / 4) {
        [self resizeTo:self.capacity >> 1];
    }
}

- (void)resizeTo:(int)newCapacity {
    
//    NSLog(@"resize: currentSize:%d, currentCapacity:%d targetCapacity:%d", self.size, self.capacity, newCapacity);
//
//    int *temp = calloc(newCapacity, sizeof(int));
//    for (int i = self.head; i < self.size; i++) {
//        temp[i] = self.container[(self.head + i) % self.capacity];
//    }
//    free(self.container);
//    self.container = temp;
//    self.head = 0;
//    self.capacity = newCapacity;
}

- (NSString *)description {
    NSMutableString *s = [NSMutableString string];
    for (int i = 0; i < self.size; i++) {
        [s appendString:[NSString stringWithFormat:@"%d - ", self.container[handleIndex(self, i)]]];
    }
    return [s copy];
}

@end
