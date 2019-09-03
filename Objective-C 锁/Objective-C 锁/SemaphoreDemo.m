//
//  SemaphoreDemo.m
//  GCD
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SemaphoreDemo.h"
@interface SemaphoreDemo()
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@end
@implementation SemaphoreDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(1);
    
    }
    return self;
}

- (void)__saleTicket {
    // 如果信号量<=0 当前线程就会键入休眠状态 知道信号量的值>0
    // 如果信号值>0 就-1 然后执行下面代码
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    [super __saleTicket];
    // 信号量+1
    dispatch_semaphore_signal(_semaphore);
}

- (void)__SaveMoney {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    [super __SaveMoney];
    dispatch_semaphore_signal(_semaphore);
}
- (void)__OutMoney {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    [super __OutMoney];
    dispatch_semaphore_signal(_semaphore);
}
@end
