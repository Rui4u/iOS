//
//  ViewController.m
//  Objective-C 锁
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"
#import "NSSpinLockDemo.h"
#import "OSUnFairLock.h"
#import "MutexDemo.h"
#import "MutexDemo-Condition.h"
#import "LockDemo.h"
#import "RecursiveLockDemo.h"
#import "ConditionDemo.h"
#import "ConditionLockDemo.h"
#import "SemaphoreDemo.h"
#import "SynchoronizedDemo.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test2];
}

- (void)test {
    //    NSSpinLockDemo *demo = [[NSSpinLockDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    //
    //    OSUnFairLock *demo = [[OSUnFairLock alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    //
    //
    //    MutexDemo *demo = [[MutexDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    //
    //    MutexDemo_Condition *demo = [[MutexDemo_Condition alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    //
    //    LockDemo *demo = [[LockDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    //
    //    RecursiveLockDemo *demo = [[RecursiveLockDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    
    //    ConditionDemo *demo = [[ConditionDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    
    //    ConditionLockDemo *demo = [[ConditionLockDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    
    //    SemaphoreDemo *demo = [[SemaphoreDemo alloc] init];
    //    [demo saleTest];
    //    [demo saveOutTest];
    
        SynchoronizedDemo *demo = [[SynchoronizedDemo alloc] init];
        [demo saleTest];
        [demo saveOutTest];
}

- (void)test2{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSSpinLockDemo *demo = [[NSSpinLockDemo alloc] init];
        [demo saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        OSUnFairLock *demo1 = [[OSUnFairLock alloc] init];
        [demo1 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        MutexDemo *demo2 = [[MutexDemo alloc] init];
        [demo2 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        MutexDemo_Condition *demo3 = [[MutexDemo_Condition alloc] init];
        [demo3 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        LockDemo *demo4 = [[LockDemo alloc] init];
        [demo4 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        RecursiveLockDemo *demo5 = [[RecursiveLockDemo alloc] init];
        [demo5 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        ConditionDemo *demo6 = [[ConditionDemo alloc] init];
        [demo6 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        ConditionLockDemo *demo7 = [[ConditionLockDemo alloc] init];
        [demo7 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        SemaphoreDemo *demo8 = [[SemaphoreDemo alloc] init];
        [demo8 saleTest];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        SynchoronizedDemo *demo9 = [[SynchoronizedDemo alloc] init];
        [demo9 saleTest];
    });
    
}
@end
