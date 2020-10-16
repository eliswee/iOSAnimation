//
//  textFieldGrandientColorView.m
//  iOSAnimation
//
//  Created by may on 2020/10/15.
//  Copyright © 2020 may. All rights reserved.
//

#import "textFieldGrandientColorView.h"

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom,
    GradientTypeLeftToRight,
    GradientTypeUpleftToLowright,
    GradientTypeUprightToLowleft,
};

@implementation textFieldGrandientColorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self foo];
    }
    return self;
}

- (void)foo
{
    self.backgroundColor = [UIColor lightGrayColor];
    
    UITextField *tx = [UITextField new];
    tx.frame = CGRectMake(30, 100, 300, 40);
    
    
    tx.delegate = self;
    
    tx.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:tx];
    
    [tx addTarget:self action:@selector(handleColor:) forControlEvents:UIControlEventEditingChanged];
    
    tx.textColor = [UIColor colorWithPatternImage:[self gradientColorImageFromColors:@[[UIColor redColor], [UIColor greenColor]] gradientType:GradientTypeTopToBottom imgSize:CGSizeMake(600, 30)]];
    
}

- (void)handleColor:(UITextField *)tx {
    CGSize size = [tx.text sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    size = CGSizeMake(600, 10);
    tx.textColor = [UIColor colorWithPatternImage:[self gradientColorImageFromColors:@[[UIColor redColor], [UIColor greenColor]] gradientType:GradientTypeTopToBottom imgSize:size]];
}

- (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    for (UIView *view in textField.subviews) {
        NSLog(@"%@", view);
    }
    return YES;
}

@end
