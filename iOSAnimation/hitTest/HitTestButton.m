//
//  HitTestButton.m
//  iOSAnimation
//
//  Created by may on 2020/7/2.
//  Copyright © 2020 may. All rights reserved.
//

#import "HitTestButton.h"

@implementation HitTestButton

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint tarP = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:tarP withEvent:event]) {
        return self.btn;
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
