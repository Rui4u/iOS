//
//  OSUnFairLock.m
//  GCD
//
//  Created by iOS on 2019/9/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "OSUnFairLock.h"
#import <os/lock.h>
@interface OSUnFairLock()
@property (nonatomic, assign) os_unfair_lock lock;
@end
@implementation OSUnFairLock
- (instancetype)init
{
    self = [super init];
    if (self) {
        _lock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}
- (void)__saleTicket {
    os_unfair_lock_lock(&_lock);
    [super __saleTicket];
    os_unfair_lock_unlock(&_lock);
}

- (void)__SaveMoney {
    os_unfair_lock_lock(&_lock);
    [super __SaveMoney];
    os_unfair_lock_unlock(&_lock);
}
- (void)__OutMoney {
    os_unfair_lock_lock(&_lock);
    [super __OutMoney];
    os_unfair_lock_unlock(&_lock);
}
@end
