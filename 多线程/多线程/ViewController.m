//
//  ViewController.m
//  多线程
//
//  Created by 赵建卫 on 2017/12/27.
//  Copyright © 2017年 赵建卫. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo8];
}
///串行队列,同步执行
- (void)demo1 {
    dispatch_queue_t queue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_SERIAL);
    for (int a = 0; a < 10; a ++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///串行队列,异步执行
- (void)demo2 {
    dispatch_queue_t queue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_SERIAL);
    for (int a = 0; a < 10; a ++) {
        dispatch_async(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///并发队列,同步执行
- (void)demo3 {
    dispatch_queue_t queue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_CONCURRENT);
    for (int a = 0; a < 10; a ++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///并发队列,异步执行
- (void)demo4 {
    dispatch_queue_t queue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_CONCURRENT);
    for (int a = 0; a < 10; a ++) {
        dispatch_async(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///全局队列,同步执行
- (void)demo5 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int a = 0; a < 10; a ++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///全局队列,异步执行()
- (void)demo6 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int a = 0; a < 10; a ++) {
        dispatch_async(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}
///主队列,同步执行
- (void)demo7 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"卡死了!");
    for (int a = 0; a < 10; a ++) {
        dispatch_sync(queue, ^{
            NSLog(@"我出不来了!!");
        });
    }
}
///主队列,异步执行()
- (void)demo8 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    for (int a = 0; a < 10; a ++) {
        dispatch_async(queue, ^{
            NSLog(@"%d--%@",a,[NSThread currentThread]);
        });
    }
}


@end
