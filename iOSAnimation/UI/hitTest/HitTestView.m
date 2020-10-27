//
//  HitTestView.m
//  iOSAnimation
//
//  Created by may on 2020/7/1.
//  Copyright © 2020 may. All rights reserved.
//

#import "HitTestView.h"
#import <CoreFoundation/CFRunLoop.h>
#import <YYKit.h>

@implementation HitTestView

- (instancetype)init {
    if (self = [super init]) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    
    CAAnimation *a ;
    a.delegate = self;
    
    UITextField *tx;
    UIButton *bt;
//    NSForegroundColorAttributeName
    
//    self->_underBtn;

//    NSDictionary *dic = [NSDictionary new];
//    dic writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>
//    [NSDictionary dictionaryWithContentsOfFile:<#(nonnull NSString *)#>]
    
    
//    [NSThread isMainThread]
//    [NSThread mainThread]
//    [NSThread currentThread]
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 把点从当前view坐标系转换到button坐标系
    CGPoint tarP = [self convertPoint:point toView:self.underBtn];
    
    // 判断button 是否包含当前点
    if ([self.underBtn pointInside:tarP withEvent:event]) {
        return self.underBtn;
    }
    else {
        NSLog(@"view click");
        return [super hitTest:point withEvent:event];
    }
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return [super pointInside:point withEvent:event];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
