//
//  Problems.c
//  iOSAnimation
//
//  Created by may on 2020/12/1.
//  Copyright © 2020 may. All rights reserved.
//

#include "Problems.h"
#include <assert.h>
#include <stdlib.h>

#pragma mark - 1
int Count (struct node * head, int searchFor) {
    struct node *cur;
    int count = 0;
    for (cur = head ; cur != NULL; cur = cur -> next) {
        count += cur -> data == searchFor ? 1 : 0;
    }
    return count;
}
void CountTest() {
    struct node *head = BuildOneTwoThree();
    
    for (int i = 0; i < 5; i++) {
        Push(&head, 5);
    }
    
    PrintLinkedList(head);
    ln();
    
    int tar = 5;
    printf("count %d", tar);
    ln();
    int count = Count(head, tar);
    printf("%d", count);
}


#pragma mark - 2

int GetNth (struct node * head, int index) {
    
    int len = Length(head);
    if (index < 0 || index >= len) {assert(0);}
    
    struct node * cur = head;
    for (int i = 0; i < index; i++) {
        cur = cur -> next;
    }
    return cur->data;
}

void GetNthTest () {
    struct node * head = BuildOneTwoThree();
    Push(&head, 200);
    int res = GetNth(head, 4);
    printf("res:%d", res);
}

#pragma mark - 3

void DeletList(struct node ** headRef) {
    struct node *tmpHead = *headRef;
    struct node *cur = NULL;
    while (tmpHead != NULL) {
        cur = tmpHead;
        tmpHead = tmpHead->next;
        free(cur);
    }
    *headRef = NULL;
}

void DeletListTest () {
    struct node * head = BuildOneTwoThree();
    DeletList(&head);
}

#pragma mark - 4

int Pop(struct node ** headRef) {
    struct node *tmpHead = *headRef;
    *headRef = (*headRef)->next;
    int data = (*(tmpHead)).data;
    free(tmpHead);
    return data;
}

void PopTest() {
    struct node *head = BuildOneTwoThree();
    int a = Pop(&head);
    int b = Pop(&head);
    int c = Pop(&head);
    int len = Length(head);
    
    printf("a:%d, b:%d, c%d, len:%d", a, b, c, len);
}

#pragma mark - 5

void InsertNth (struct node ** headRef, int index, int data) {
    
    int len = Length(*headRef);
    if (index < 0 || index > len) { assert(0); }
    if (index == 0) {
        Push(headRef, data);
    }
    else {
        struct node *cur = *headRef;
        for (int i = 0; i < index - 1; i++) {
            cur = cur->next;
        }
//        cur->next = CreateNode(data, cur->next);
        Push(&(cur->next), data);
    }
}

void InsertNthTest() {
    struct node * head = NULL;
    InsertNth(&head, 0, 13);
    PrintLinkedList(head);
    InsertNth(&head, 1, 50);
    PrintLinkedList(head);
    InsertNth(&head, 1, 200);
    InsertNth(&head, 2, 300);
    PrintLinkedList(head);
    Destory(head);
}

#pragma mark - 6

void SortedInsert (struct node ** headRef, struct node * newNode) {
    if (*headRef == NULL || ((*headRef)->data >= newNode->data)) {
        newNode->next = *headRef;
        *headRef = newNode;
    } else {
        int len = Length(*headRef);
        struct node *cur = (*headRef);
        for (int i = 0; i < len - 1; i++) {
            if (cur->next->data >= newNode->data) {
                newNode->next = cur->next;
                cur->next = newNode;
                return;
            }
            cur = cur->next;
        }
        cur->next = newNode;
    }
}

void SortedInsert1 (struct node ** headRef, struct node * newNode) {
    struct node *dummyHead = CreateNode(-1, *headRef);
    for (struct node *cur = dummyHead; cur != NULL; cur = cur->next) {
        if (cur->next->data >= newNode->data) {
            newNode->next = cur->next;
            cur->next = newNode;
        }
    }
}

void SortedInsertTest () {
    
    struct node * head = BuildOneTwoThree();
    struct node * tar0 = CreateNode(0, NULL);
    SortedInsert1(&head, tar0);
    struct node * tar1 = CreateNode(4, NULL);
    SortedInsert1(&head, tar1);
    struct node * tar2 = CreateNode(3, NULL);
    SortedInsert1(&head, tar2);
    struct node * tar3 = CreateNode(1, NULL);
    SortedInsert1(&head, tar3);
    struct node * tar4 = CreateNode(100, NULL);
    SortedInsert1(&head, tar4);
    
    PrintLinkedList(head);
}

#pragma mark - 7

void InsertSort(struct node ** headRef) {
    struct node *tmp = NULL;
    struct node *cur = *headRef;
    while (cur != NULL) {
        struct node * t = CreateNode(cur->data, NULL);
        SortedInsert(&tmp, t);
        cur = cur->next;
    }
    *headRef = tmp;
}

void InsertSortTest () {
    struct node * head = NULL;
    Push(&head, 200);
    Push(&head, 32);
    Push(&head, 43);
    Push(&head, 232);
    Push(&head, 1);
    Push(&head, 0);
    Push(&head, 49035);
    InsertSort(&head);
    PrintLinkedList(head);
}

#pragma mark - 8

void Append (struct node ** aRef, struct node ** bRef) {
    
    if (!*aRef) {
        *aRef = *bRef;
        *bRef = NULL;
        return;
    }
    
    struct node * lastA = *aRef;
    while (lastA->next != NULL) {
        lastA = lastA->next;
    }
    lastA->next = *bRef;
    *bRef = NULL;
}

void AppendTest () {
    struct node * a = NULL; //BuildOneTwoThree();
    Push(&a, 158);
    PrintLinkedList(a);
    struct node * b = BuildOneTwoThree();
    Push(&b, 266);
    PrintLinkedList(b);
    Append(&a, &b);
    PrintLinkedList(a);
    PrintLinkedList(b);
}

#pragma mark - 9

void FrontBackSplit (struct node *source, struct node **frontRef, struct node **backRef) {
    /***** solution 1 for *****/
    
//    if (!source) {
//        return;
//    }
//
//    int len = Length(source);
//
//    if (len == 1) {
//        *frontRef = source;
//        return;
//    } else if (len == 2) {
//        *frontRef = source;
//        *backRef = source->next;
//        (*frontRef)->next = NULL;
//        return;
//    }
//
//    *frontRef = source;
//    struct node *f = source;
//    for (int i = 0; i < (len - 1)/2; i++) {
//        f = f->next;
//    }
//    *backRef = f->next;
//    f->next = NULL;
    
    
    
    /*** solution 2 fast & slow pointer ***/
    
    
    if (!source) {
        return;
    }

    int len = Length(source);

    if (len == 1) {
        *frontRef = source;
        return;
    } else if (len == 2) {
        *frontRef = source;
        *backRef = source->next;
        (*frontRef)->next = NULL;
        return;
    }
    
    *frontRef = source;
    struct node *fast = source;
    struct node *slow = source;
    
    while (fast->next != NULL && fast->next->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
    }
    
    *backRef = slow->next;
    slow->next = NULL;
}

void FrontBackSplitTest () {

    struct node * head = NULL;
    struct node * front = NULL;
    struct node * back = NULL;
    
    for (int i = 0; i < 20; i++) {
        Push(&head, i);
    }
    
    PrintLinkedList(head);
    FrontBackSplit(head, &front, &back);
    PrintLinkedList(front);
    PrintLinkedList(back);
}

#pragma mark - 10

void RemoveDuplicates (struct node *head) {
    
    // the list should only be traversed once;
    
    if (head->next == NULL) { return; }
    
    int tmp = head->data;
    struct node *cur = head;
    while (cur != NULL) {
        tmp = cur->data;
        if (cur -> next) {
            if (tmp == cur->next->data) {
                struct node *tmp = cur->next;
                cur->next = cur->next->next;
                free(tmp);
                continue;
            }
        }
        cur = cur->next;
    }
}

void RemoveDuplicatesTest () {
    
    struct node *head = BuildOneTwoThree();
    Push(&head, 2);
    Push(&head, 6);
    Push(&head, 2);
    Push(&head, 1);
    Push(&head, 3);
    Push(&head, 6);
    Push(&head, 7);
    Push(&head, 8);
    Push(&head, 8);
    Push(&head, 8);
    PrintLinkedList(head);
    InsertSort(&head);
    PrintLinkedList(head);
    RemoveDuplicates(head);
    PrintLinkedList(head);
}

#pragma mark - 11

void MoveNode (struct node **destRef, struct node **sourceRef) {
    struct node *tmpSource = (*sourceRef)->next;
    (*(*sourceRef)).next = *destRef;
    *destRef = *sourceRef;
    *sourceRef = tmpSource;
}

void MoveNodeTest () {
    
    struct node *dest = BuildOneTwoThree();
    struct node *source = BuildOneTwoThree();
    Push(&dest, 5);
    Push(&source, 6);
    MoveNode(&dest, &source);
    PrintLinkedList(dest);
    PrintLinkedList(source);
}

#pragma mark - 12

void AlternatingSplit(struct node *source, struct node **aRef, struct node **bRef) {
    int idx = 0;
    struct node *cur = source;
    while (cur != NULL) {
        if (idx % 2 == 0) {
            MoveNode(aRef, &cur);
        } else {
            MoveNode(bRef, &cur);
        }
        idx++;
    }
}

void AlternatingSplitTest () {
    
    struct node *a, *b = NULL;
    struct node *source = NULL;
    
    for (int i = 0 ; i < 5; i++) {
        Push(&source, i);
    }
    
    PrintLinkedList(source);
    AlternatingSplit(source, &a, &b);
    PrintLinkedList(a);
    PrintLinkedList(b);
}

#pragma mark - 13

struct node * ShuffleMerge (struct node *a, struct node *b) {
    
    int idx = 0;
    struct node *res = NULL;
    while (a!=NULL || b!=NULL) {
        if (idx % 2 ==0) {
            if (a != NULL) {
                MoveNode(&res, &a);
            }
        } else {
            if (b != NULL) {
                MoveNode(&res, &b);
            }
        }
        idx++;
    }
    
    struct node *des = NULL;
    while (res!=NULL) {
        Push(&des, Pop(&res));
    }
    return des;
}

void ShuffleMergeTest () {
    struct node *a = BuildOneTwoThree();
    Push(&a, 11);
    struct node *b = BuildOneTwoThree();
    Push(&b, 22);
    Push(&b, 33);
    Push(&b, 44);
    PrintLinkedList(a);
    PrintLinkedList(b);
    struct node *new = ShuffleMerge(a, b);
    PrintLinkedList(new);
}

#pragma mark - 14

struct node * SortedMerge (struct node *a , struct node *b) {
    
    struct node *tmp = NULL;
    while (a != NULL || b != NULL) {
        if ( a!= NULL && b != NULL) {
            if (a->data <= b->data) {
                MoveNode(&tmp, &a);
            } else {
                MoveNode(&tmp, &b);
            }
        } else if (a!= NULL) {
            MoveNode(&tmp, &a);
        } else {
            MoveNode(&tmp, &b);
        }
    }
    struct node *des = NULL;
    while (tmp!=NULL) {
        Push(&des, Pop(&tmp));
    }
    return des;
}

void SortedMergeTest () {
    struct node *a = BuildOneTwoThree();
    struct node *b = BuildOneTwoThree();
    AddLast(a, 10);
    AddLast(a, 20);
    AddLast(b, 50);
    AddLast(b, 100);
    AddLast(b, 200);
    AddLast(b, 300);
    struct node *res = SortedMerge(a, b);
    PrintLinkedList(res);
}

#pragma mark - 15

void MergeSort(struct node * headRef) {
    
}

void MergeSortTest () {
    
}


#pragma mark - 16

//int main () {
//    SortedInsertTest();
//    return 0;
//}
