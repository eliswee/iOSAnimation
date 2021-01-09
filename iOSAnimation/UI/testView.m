//
//  testView.m
//  iOSAnimation
//
//  Created by may on 2020/10/23.
//  Copyright © 2020 may. All rights reserved.
//

#import "testView.h"

@implementation testView

- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:@"哈哈哈哈" attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Medium" size:19]}];
    UILabel *lab = [UILabel new];
    lab.attributedText = att;
    
    lab.frame = CGRectMake(80, 100, 0, 0);
    
    [self addSubview:lab];
    [lab sizeToFit];
    
    
    NSLog(@"faName:%@", lab.font.familyName);
    NSLog(@"name:%@", lab.font.fontName);
    NSLog(@"%@", [NSString stringWithFormat:@"capHeight-%f    xHeight-%f    lineHeight:", lab.font.capHeight, lab.font.xHeight, lab.font.lineHeight]);
    
    
//    UIBezierPath *re = [UIBezierPath bezierPathWithRect:CGRectMake(30, 100, 100, 100)];
//    re.lineWidth = 1.f;
//    [re stroke];
//
//    UIBezierPath *round = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30 + 15, 100 + 15, 70, 70) cornerRadius:50];
//    round.lineWidth = 30;
//    [round stroke];
}


@end
