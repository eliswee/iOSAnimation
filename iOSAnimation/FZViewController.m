//
//  FZViewController.m
//  iOSAnimation
//
//  Created by may on 2021/1/5.
//  Copyright © 2021 may. All rights reserved.
//

#import "FZViewController.h"
#import <pthread.h>

@interface FZViewController ()

@end

@implementation FZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_queue_t queue = dispatch_queue_create("com.gfzq.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
//    UITextField *tx;
//    tx.leftView;
//    tx.rightView;
    
    /*
         self.view.layer.presentationLayer;
         self.view.layer.modelLayer;
         
         presentationLayer，其本身是当前帧的一个拷贝，每次获取都是一个新的对象，和动画过程中屏幕上显示的位置是一样的。
         modelLayer，表示layer动画完成后的真实值，如果打印一下modelLayer和layer的话，发现二者其实是一个对象。
         renderLayer，渲染帧，应用程序会根据视图层级，构成由layer组成的渲染树，renderLayer就代表layer在渲染树中的对象。
     */
    
    /*
     
     CAMediaTiming协议是用来对动画过程控制的一个协议，例如通过CoreAnimation创建的动画，CALayer遵守了这个协议。这样如果需要对动画进行控制的话，不需要引用一个CABasicAnimation对象，然后再修改动画属性这种方式对动画流程进行控制，只需要直接对layer的属性进行修改即可。
     
     下面是CAMediaTiming协议中一些关键的属性，在上文中也用到了其中的部分属性。
     beginTime，动画开始时间，可以控制动画延迟展示。一般是一个绝对时间，为了保证准确性，最好先对当前layer进行一个转换，延迟展示在后面加对应的时间即可。
     duration，动画结束时间。
     speed，动画执行速度，默认是1。动画最终执行时间=duration/speed，也就是duration是3秒，speed是2，最终动画执行时间是1.5秒。
     timeOffset，控制动画进程，主要用来结合speed来对动画进行暂停和开始。
     repeatCount，重复执行次数，和repeatDuration互斥。
     repeatDuration，重复执行时间，如果时间不是duration的倍数，最后一次的动画会执行不完整。
     autoreverses，动画反转，在动画执行完成后，是否按照原先的过程反向执行一次。此属性会对duration有一个叠加效果，如果duration是1s，autoreverses设置为YES后时间就是2s。
     fillMode，如果想要动画在开始时，就停留在fromValue的位置，就可以设置为kCAFillModeBackwards。如果想要动画结束时停留在toValue的位置，就设置为kCAFillModeForwards，如果两种都要就设置为kCAFillModeBoth，默认是kCAFillModeRemoved，即动画结束后移除。

     */
    
    
    // 递归互斥锁
    /** Mutex type attributes
     
     #define PTHREAD_MUTEX_NORMAL        0
     #define PTHREAD_MUTEX_ERRORCHECK    1
     #define PTHREAD_MUTEX_RECURSIVE     2
     #define PTHREAD_MUTEX_DEFAULT       PTHREAD_MUTEX_NORMAL
     
     pthread_mutexattr_t attr;
     pthread_mutexattr_init (&attr);
     pthread_mutexattr_settype (&attr, PTHREAD_MUTEX_RECURSIVE);
     pthread_mutex_init (&_lock, &attr);
     pthread_mutexattr_destroy (&attr);
     
     */
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
