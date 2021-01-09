//
//  LinkedListProblems.h
//  iOSAnimation
//
//  Created by may on 2020/11/30.
//  Copyright © 2020 may. All rights reserved.
//

#ifndef LinkedListProblems_h
#define LinkedListProblems_h

#include <stdio.h>

struct node {
    int data;
    struct node * next;
};

/// get linkedList lenght
/// @param head head of a linkedList
int Length(struct node * head);

/// convenient method to crate a linkedList {1, 2, 3}
struct node *BuildOneTwoThree(void);

/// push a new data to LinkedList
/// @param headRef reference to a LinkedList
/// @param newData new data
void Push(struct node ** headRef, int newData);

void AddLast(struct node *head, int data);
void AddLastNode(struct node *head, struct node *node);


void Destory(struct node * head);

void PrintLinkedList(struct node *head);

void ln(void);

struct node *CreateNode(int data, struct node * next);

struct node *BuildOneTwoThree(void);

int RandomInRange(int range);

#endif /* LinkedListProblems_h */
