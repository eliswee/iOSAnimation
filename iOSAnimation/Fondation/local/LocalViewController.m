//
//  LocalViewController.m
//  iOSAnimation
//
//  Created by may on 2020/7/3.
//  Copyright © 2020 may. All rights reserved.
//

#import "LocalViewController.h"

@interface LocalViewController ()

@end

@implementation LocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Documents:最常用的目录，iTunes同步该应用时会同步此文件夹中的内容，适合存储重要数据。
    __unused NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    // Library/Caches: iTunes不会同步此文件夹，适合存储体积大，不需要备份的非重要数据。
    __unused NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    
    // Library/Preferences: iTunes同步该应用时会同步此文件夹中的内容，通常保存应用的设置信息。
    __unused NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    
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
