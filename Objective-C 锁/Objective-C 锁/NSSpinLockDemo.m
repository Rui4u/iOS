//
//  NSSpinLockDemo.m
//  GCD
//
//  Created by iOS on 2019/9/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "NSSpinLockDemo.h"
#import <libkern/OSAtomic.h>
@interface NSSpinLockDemo()
@property (nonatomic, assign) OSSpinLock lock;
@end
@implementation NSSpinLockDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = OS_SPINLOCK_INIT;
    }
    return self;
}
- (void)__saleTicket {
    OSSpinLockLock(&_lock);
    [super __saleTicket];
    OSSpinLockUnlock(&_lock);
}

- (void)__SaveMoney {
    OSSpinLockLock(&_lock);
    [super __SaveMoney];
    OSSpinLockUnlock(&_lock);
}
- (void)__OutMoney {
    OSSpinLockLock(&_lock);
    [super __OutMoney];
    OSSpinLockUnlock(&_lock);
}
@end
