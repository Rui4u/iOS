
//
//  MutexDemo.m
//  GCD
//
//  Created by iOS on 2019/9/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>
@interface MutexDemo()
@property (nonatomic, assign) pthread_mutex_t lock;
@end
@implementation MutexDemo

- (void) creatLock:(pthread_mutex_t *) mutex {
    pthread_mutexattr_t attr = {0};
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatLock:&_lock];
    }
    return self;
}
- (void)__saleTicket {
    pthread_mutex_lock(&_lock);
    [super __saleTicket];
    pthread_mutex_unlock(&_lock);
}

- (void)__SaveMoney {
    pthread_mutex_lock(&_lock);
    [super __SaveMoney];
    pthread_mutex_unlock(&_lock);
}
- (void)__OutMoney {
    pthread_mutex_lock(&_lock);

    [super __OutMoney];
    pthread_mutex_unlock(&_lock);
}
@end
