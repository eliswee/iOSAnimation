//
//  LinkedListProblems.c
//  iOSAnimation
//
//  Created by may on 2020/11/30.
//  Copyright © 2020 may. All rights reserved.
//

#include "LinkedListProblems.h"
#include <stdlib.h>

int RandomInRange(int range) {
    return random() % range;
}

void ln() {
    printf("\r");
}

void PrintLinkedList(struct node *head) {
    if (!head) {
        printf("NULL");
        ln();
        return;;
    }
    struct node * temp = head;
    while (temp != NULL) {
        printf("%d,", temp->data);
        temp = temp->next;
    }
    ln();
}

int Length(struct node * head) {
//    // while version
//    struct node * temp = head;
//    int count = 0;
//    while (temp != NULL) {
//        count++;
//        temp = temp->next;
//    }
//    return count;
    
    // for version
    int count = 0;
    for (struct node *current = head; current != NULL; current = current->next) {
        count++;
    }
    return count;
}

struct node *CreateNode(int data, struct node * next) {
    struct node * node = calloc(1, sizeof(struct node));
    node->data = data;
    node->next = next;
    return node;
}

void Push(struct node ** headRef, int newData) {
    *headRef = CreateNode(newData, *headRef);
}

struct node *BuildOneTwoThree(void) {
    struct node *node = CreateNode(3, NULL);
    Push(&node, 2);
    Push(&node, 1);
    return node;
}

void Destory(struct node * head) {
    struct node *temp = head;
    while (temp != NULL) {
        struct node *cur = temp;
        temp = temp->next;
        free(cur);
    }
}

void AddLast(struct node *head, int data) {
    if (!head) { return; }
    while (head->next != NULL) {
        head = head->next;
    }
    head->next = CreateNode(data, NULL);
}

void AddLastNode(struct node *head, struct node *node) {
    if (!head) {return;}
    while (head->next != NULL) {
        head = head->next;
    }
    head->next = node;
}

//int main() {
//    
//    struct node *head = NULL;
//    struct node **lastPtrRef = &head;
//    
//    for (int i = 1; i < 6; i++) {
//        Push(lastPtrRef, i);
//        lastPtrRef = &((*lastPtrRef) -> next);
//    }
//    
//    PrintLinkedList(head);
//    
//    Destory(head);
//    
//    return 0;
//}
