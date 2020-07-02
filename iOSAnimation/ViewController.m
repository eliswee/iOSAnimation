//
//  ViewController.m
//  iOSAnimation
//
//  Created by may on 2019/12/27.
//  Copyright © 2019 may. All rights reserved.
//

#import "ViewController.h"

#import "hitTest/HitTestViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    HitTestViewController *hitVC = [HitTestViewController new];
    hitVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:hitVC animated:YES completion:nil];
}



@end
