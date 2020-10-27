//
//  HitTestViewController_1.m
//  iOSAnimation
//
//  Created by may on 2020/7/2.
//  Copyright © 2020 may. All rights reserved.
//

#import "HitTestViewController_1.h"
#import "HitTestButton.h"

@interface HitTestViewController_1 ()

@end

@implementation HitTestViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    HitTestButton *hb = [HitTestButton buttonWithType:UIButtonTypeCustom];
    hb.frame = CGRectMake(0, 0, 100, 50);
    [hb setTitle:@"title" forState:UIControlStateNormal];
    [self.view addSubview:hb];
    hb.center = self.view.center;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(hb.frame.size.width / 2, -80, 100, 80);
    [hb addSubview:btn];
    hb.btn = btn;
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
