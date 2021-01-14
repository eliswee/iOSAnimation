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

- (void)tap {
    NSLog(@"btn click");
//    [UIFont systemFontOfSize:12].pointSize
//    [UIFont systemFontOfSize:12].lineHeight
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
