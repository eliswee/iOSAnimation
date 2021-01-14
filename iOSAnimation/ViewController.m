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

#import <pthread.h>
#import "lock.h"

@interface ViewController () <UITextFieldDelegate> {
//    NSString *_haha;
}

//@property (nonatomic, strong) FZDownLoader *downLoader;

@property (nonatomic, assign) pthread_mutex_t mutexLock;

@property (nonatomic, assign) struct testStr{ int a ; int b; }struc;
@property (nonatomic, assign) CGPoint point;

@property (nonatomic, copy) NSString *haha;

@end

struct perserA {
    int a;
    char c;
    char *d;
} ;

//struct perserB:perserA {
//    char *;
//};



@implementation ViewController

@synthesize haha = _haha;

- (void)setHaha:(NSString *)haha {
    _haha = haha;
}

- (NSString *)haha {
    return _haha;
}

// http://u733.195-cmcc-dd.tv002.com/down/79bb62df3dbc9d2f827dbcda21795026/Boostnote-0.11.17.dmg?cts=yd-f-D221A181A101A37F180ba&ctp=221A181A101A37&ctt=1595596617&limit=1&spd=30000&ctk=79bb62df3dbc9d2f827dbcda21795026&chk=b33b6d97c24d0cd83a32f940f1b475e4-85903578&mtd=1

/*
 tips:
    viewDidLoad方法中
    1.modal无效（视图显示出来之前跳转无效）
    2.safeArea无效
*/

int foo (int a, int b) {
    return a + b;
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    // safe area change
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [lock new];
    
//    [FZSQLite3Test new];
    
//    self.mutexLock = (pthread_mutex_t)PTHREAD_MUTEX_INITIALIZER;
//    struct perserA pp;
//    pp = (struct perserA){1, 'c', "abc"};
//    struct perserA p  = {.a = 1, .c = 'c', .d = "abc"};
//    NSLog(@"%d, %c, %s", p.a, p.c, p.d);
    
//    self.point = ({
//        CGPoint point;
//        point.x = 10;
//        point.y = 20;
//        point;
//    });
//
//    CGPoint pp = {100, 200};
//    CGPoint p = pp;
//
//    self.point = (CGPoint){200, 300};
//
//    self.point = p;
//    self.point = CGPointMake(0, 0);
    
    
//    struct testStrct {int a; int b;} testStr = {10, 20};
//
//    NSLog(@"%d, %d", testStr.a, testStr.b);
    
    self.view.backgroundColor = [UIColor greenColor];
    
//    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    cachePath = [cachePath stringByAppendingPathComponent:@"com.miguvideo.NPSStore"].copy;
//    NSDictionary* dic = @{@"ha" : @"123"};
//    BOOL b = [dic writeToFile:cachePath atomically:YES];
}

static pthread_mutex_t _mutex;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    self.t = PTHREAD_MUTEX_INITIALIZER;
    
//    PTHREAD_MUTEX_INITIALIZER
    
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL); // 非递归
//
//
//    pthread_mutex_init(&_mutex, &attr);
//
//    pthread_mutex_lock(&_mutex);
//    pthread_mutex_unlock(&_mutex);
//
//    pthread_mutexattr_destroy(&attr);
//    pthread_mutex_destroy(&_mutex);
//
//
//
//    os_unfair_lock lock;
    
//    NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"111%@", [NSThread currentThread]);
//        NSLog(@"111-111");
//        sleep(1.f);
//        NSLog(@"111-222");
//    }];
//
//    [bop addExecutionBlock:^{
//        NSLog(@"222%@", [NSThread currentThread]);
//        NSLog(@"222-111");
//        sleep(1.f);
//        NSLog(@"222-222");
//    }];
//
//    [bop start]; // 会占用当前线程
//
//    NSLog(@"after");
//
////    [bop waitUntilFinished];
//
//    [NSThread detachNewThreadWithBlock:^{
//    }];
//    [NSThread detachNewThreadSelector:@selector(foo) toTarget:self withObject:nil];
    
//    testView *v = [testView new];
//    v.backgroundColor = [UIColor whiteColor];
//    v.frame = self.view.bounds;
//    [self.view addSubview:v];
    
    
//    NSMutableString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject.mutableCopy;
//    cachePath = [cachePath stringByAppendingPathComponent:@"com.miguvideo.NPSStore"].copy;
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:cachePath];
//    NSLog(@"%@", dic);
    
//    HitTestViewController_1 *hitVC = [HitTestViewController_1 new];
//    hitVC.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:hitVC animated:YES completion:nil];
}

- (void)foo {
    
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
