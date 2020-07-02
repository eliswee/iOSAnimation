//
//  HitTestViewController.m
//  iOSAnimation
//
//  Created by may on 2020/7/1.
//  Copyright © 2020 may. All rights reserved.
//

#import "HitTestViewController.h"
#import "HitTestView.h"
#import <UIView+YYAdd.h>

@interface HitTestViewController ()

@end

@implementation HitTestViewController

// 触摸事件
/*
    事件分为三类：触摸事件， 陀螺仪事件， 遥控事件
    
 触摸事件： 系统发送给当前进程对应的UIApplication管理的队列，UIApplication每次(时机？)出队一个事件通过响应链传递。
 继承自UIResponder的类通过实现hitTest方法来查找最适合的响应对象，UIApplication、UIViewController、UIView都继承自UIResponder，它们都是响应者，都能够接收并处理事件。
 UIResponder提供了以下方法来处理触摸事件：
    - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event; // 触摸开始
    - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event; // 触摸移动
    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event; // 触摸结束
    - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
    一个手指对应一个touche对象，touch对象包含了触摸的view，时间，点击的次数等信息，还可以获取当前触摸的点以及上次触摸的点。
        取当前手指所在的点
        - (CGPoint)locationInView:(UIView *)view;
        获取上一个触摸点的位置.
        - (CGPoint)previousLocationInView:(UIView *)view;
    event:
    每产生一个事件，就会产生一个UIEvent对象
    UIEvent：称为事件对象，记录事件产生的时刻和类型
 父控件不能接收事件则子控件也不能接收事件。
    不能接收事件的状况：
        1.userInteractionEnabled = NO  // UIImageView默认是NO
        2.hidden = YES
        3.alpha = 0;
        4.frame超出父控件。
 
 寻找响应者的顺序：
    1.先判断自身能否接收触摸事件，如果能再继续往下判断。
    2.再判断触摸的当前点在不在自己身上。
    3.如果在自己身上，它会从后往前遍历子控件，遍历的每一个子控件重复前两步。
    4.如果没有符合条件的子控件，那么它自己就是最合适的view。
 
 
 -(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
 只要一个事件传递给一个控件时，就会调用这个方法
 hitTest方法会调用pointInside方法确认点击是否在自身上面。
 
 判断point在不在方法调用者身上
 point: 必须是方法调用者的坐标系
 hitTest底层会调用这个方法，判断当前点在不在自己身上
 -(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
 
 hitTest底层实现:
 
 1.判断当前能不能接收事件
    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01)
    return  nil;
 
 2.判断触摸点在不在当前的控件上
    if(![self pointInside:point withEvent:event])
    return nil;
 
 3.从后往前遍历自己的子控件
    int count = (int)self.subviews.count;
    for (int i = count - 1; i >= 0; i-- ) {
        UIView *childV = self.subviews[i];
        把当前坐标系上的点转换成子控件坐标系上的点.
        CGPoint childP = [self convertPoint:point toView:childV];
        判断自己的子控件是不是最适合的View
        UIView *fitView = [childV hitTest:childP withEvent:event];
        如果子控件是最适拿的View,直接返回
            if (fitView) {
                return  fitView;
            }
    }

 4.自己就是最适合的View
     return self
 
 
 
 */

- (void)tap {
    NSLog(@"btn click");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor grayColor];
    btn.frame = CGRectMake(0, self.view.height/2, self.view.height, 30);
    [btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    HitTestView *tv = [HitTestView new];
    tv.underBtn = btn;
    tv.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
    tv.frame = CGRectMake(50, 0, 300, 500);
    [self.view addSubview:tv];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
