//
//  ViewController.m
//  iOSAnimation
//
//  Created by may on 2019/12/27.
//  Copyright © 2019 may. All rights reserved.
//

#import "ViewController.h"
#import "HitTestViewController.h"
#import "HitTestViewController_1.h"
#import "FZDownLoader.h"
#import "FZCollectionViewController.h"
#import "FZSQLite3Test.h"
#import "MRC.h"
#import <UIColor+YYAdd.h>
#import "testView.h"


@interface ViewController () <UITextFieldDelegate>

//@property (nonatomic, strong) FZDownLoader *downLoader;

@end

@implementation ViewController

// http://u733.195-cmcc-dd.tv002.com/down/79bb62df3dbc9d2f827dbcda21795026/Boostnote-0.11.17.dmg?cts=yd-f-D221A181A101A37F180ba&ctp=221A181A101A37&ctt=1595596617&limit=1&spd=30000&ctk=79bb62df3dbc9d2f827dbcda21795026&chk=b33b6d97c24d0cd83a32f940f1b475e4-85903578&mtd=1

/*
 tips:
    viewDidLoad方法中modal无效（视图显示出来之前跳转无效）
*/

- (void)viewDidLoad {
    [super viewDidLoad];
//    [FZSQLite3Test new];
        


    
//    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    cachePath = [cachePath stringByAppendingPathComponent:@"com.miguvideo.NPSStore"].copy;
//    NSDictionary* dic = @{@"ha" : @"123"};
//    BOOL b = [dic writeToFile:cachePath atomically:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    testView *v = [testView new];
    v.backgroundColor = [UIColor whiteColor];
    v.frame = self.view.bounds;
    [self.view addSubview:v];
    
    
//    NSMutableString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject.mutableCopy;
//    cachePath = [cachePath stringByAppendingPathComponent:@"com.miguvideo.NPSStore"].copy;
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:cachePath];
//    NSLog(@"%@", dic);
    
//    HitTestViewController_1 *hitVC = [HitTestViewController_1 new];
//    hitVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:hitVC animated:YES completion:nil];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
////    [self.downLoader downLoadURLStr:@"https://desk-fd.zol-img.com.cn/t_s1920x1080c5/g5/M00/01/0F/ChMkJ1bKwnSIE3zeAAs7wp7GNWsAALGoQKq84kACzva221.jpg"];
//
////    NSArray *data = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13"]; //  @"11",
////    FZCollectionViewController *fc = [FZCollectionViewController new];
////    fc.dataStrs = data;
////    [self presentViewController:fc animated:YES completion:nil];
//}

#pragma mark - getters

//- (FZDownLoader *)downLoader {
//    if (!_downLoader) {
//        _downLoader = [[FZDownLoader alloc] init];
//    }
//    return _downLoader;
//}

@end
