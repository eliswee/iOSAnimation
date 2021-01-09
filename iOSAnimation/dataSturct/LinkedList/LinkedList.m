//
//  LinkedList.m
//  iOSAnimation
//
//  Created by may on 2020/11/13.
//  Copyright © 2020 may. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList()

@property (nonatomic, strong) Node *head;
@property (nonatomic, assign) int size;

@end

@implementation LinkedList

- (instancetype)init {
    if (self = [super init]) {
        _head = nil;
        _size = 0;
    }
    return self;
}

- (int)getSize {
    return self.size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)addFirst:(int)data {
    self.head = [[Node alloc] initWithData:data next:self.head];
    self.size++;
}

- (void)addLast:(int)data {
    [self add:data toIndex:self.size - 1];
}

- (void)add:(int)data toIndex:(int)index {
    if (index == 0) {
        [self addFirst:data];
    } else {
        Node *pre = self.head;
        for (int i = 0; i < index - 1; i++) {
            pre = pre.next;
        }
        pre.next = [[Node alloc] initWithData:data next:pre.next];
        self.size++;
    }
}

- (void)remove:(int)data {
    if ([self isEmpty]) {return;}
}

- (void)removeAll:(int)data {
    
}

- (void)removeIndex:(int)index {
    if ([self isEmpty]) {return;}
    
    Node *pre = self.head;
    
//    for (int i = 0; i < ; i++) {
//        
//    }
    
}

- (void)removeFirst {
    if ([self isEmpty]) {return;}
    self.head = self.head.next;
    self.size--;
}

- (void)removeLast {
    if ([self isEmpty]) {return;}
    Node *temp = self.head;
    NSLog(@"%d", self.size);
    for (int i = 0; i < self.size - 2; i++) {
        temp = temp.next;
    }
    NSLog(@"%@", temp);
    temp.next = nil;
    self.size--;
}

- (NSString *)description {
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"LinkedList : top-["];
    
    Node *node = self.head;
    while (node.next != nil) {
        [str appendFormat:@"%@, ", node];
        node = node.next;
    }
    [str appendString:@"]"];
    return str.copy;
}

@end
