//
//  ViewController.m
//  读写锁
//
//  Created by iOS on 2019/9/4.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()
@property (nonatomic, assign) pthread_rwlock_t lock;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pthread_rwlock_init(&_lock, NULL);
    dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _queue = dispatch_queue_create("rwqueue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i ++) {
        [self read];
        [self write];
        [self write];
        [self read];
    }
    
}

- (void) read {
    dispatch_async(_queue, ^{
        sleep(1);
        NSLog(@"read");
    });
}

- (void) write {
    dispatch_barrier_async(_queue, ^{
        sleep(1);
        NSLog(@"write");
    });
}

//- (void)pthread_rwlock_test {
//    dispatch_queue_t queue = dispatch_queue_create("rwqueue", DISPATCH_QUEUE_CONCURRENT);
//    for (int i = 0; i < 10; i ++) {
//        dispatch_async(queue, ^{
//            for (int i = 0; i < 10; i ++) {
//                [self read];
//            }
//        });
//
//        dispatch_async(queue, ^{
//            for (int i = 0; i < 10; i ++) {
//                [self read];
//            }
//        });
//
//        dispatch_async(queue, ^{
//            [self write];
//        });
//    }
//}

//- (void) read {
//    pthread_rwlock_rdlock(&_lock);
//    sleep(1);
//    NSLog(@"read");
//    pthread_rwlock_unlock(&_lock);
//}
//
//- (void) write {
//    pthread_rwlock_wrlock(&_lock);
//    sleep(1);
//    NSLog(@"write");
//    pthread_rwlock_unlock(&_lock);
//}

@end
