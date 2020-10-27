//
//  testView.m
//  iOSAnimation
//
//  Created by may on 2020/10/23.
//  Copyright © 2020 may. All rights reserved.
//

#import "testView.h"

@implementation testView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:@"哈哈哈哈" attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Medium" size:15]}];
    UILabel *lab = [UILabel new];
    lab.attributedText = att;
    
    [self addSubview:lab];
    [lab sizeToFit];
    
    
    
    NSLog(@"%@", [NSString stringWithFormat:@"%f", lab.font.capHeight]);
    
    
//    UIBezierPath *re = [UIBezierPath bezierPathWithRect:CGRectMake(30, 100, 100, 100)];
//    re.lineWidth = 1.f;
//    [re stroke];
//
//    UIBezierPath *round = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30 + 15, 100 + 15, 70, 70) cornerRadius:50];
//    round.lineWidth = 30;
//    [round stroke];
}


@end
