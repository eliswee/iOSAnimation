//
//  mutableParams.m
//  iOSAnimation
//
//  Created by may on 2020/9/28.
//  Copyright © 2020 may. All rights reserved.
//

#import "mutableParams.h"

@implementation mutableParams

/*
    相关宏定义
    va_list C语言中定义的一个指针， 用于指向当前的参数
    va_start(ap, param) 初始化参数列表，启动第一个参数是va_list对象，第二个参数是参数列表的第一个参数。
    va_arg(ap, type) 一个用于取出参数的宏，这个宏的第一个参数是va_list对象，第二个参数是要取出的参数类型。
    va_end(ap) 关闭取参列表
 
    注意：1.调用传参必须要在最后面加上nil。
         2.必须明确每个参数的类型。
 NS_REQUIRES_NIL_TERMINATION : 需要nil结尾 编译命令
 原理：函数的参数是被放入函数的栈空间的，放入的顺序是从后往前放，这样出栈的时候就可以从前往后出，
 */

- (void)foo:(NSString *)str, ... {
    
    va_list list; // 列表指针对象
    va_start(list, str); // 列表初始化， str为省略前的第一个参数， 既...之前的那个参数
    NSString *tempStr = str;
    while (tempStr != nil) {
        NSLog(@"%@", tempStr);
        tempStr = va_arg(list, NSString *); // 返回取到的值，并让指针指向下一个参数地址
    }
    va_end(list); // 关闭列表指针
    
}

@end
