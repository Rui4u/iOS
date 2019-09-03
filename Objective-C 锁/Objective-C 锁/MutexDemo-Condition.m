//
//  MutexDemo-Condition.m
//  GCD
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "MutexDemo-Condition.h"
#import <pthread.h>
@interface MutexDemo_Condition()
@property (nonatomic, assign) pthread_mutex_t lock;
@property (nonatomic, assign) pthread_cond_t condition;
@property (nonatomic, assign, getter=isDoTest1) BOOL doTest1;

@property (nonatomic, assign) BOOL isCanOut;
@end
@implementation MutexDemo_Condition
- (void) __initLock:(pthread_mutex_t *) mutex {
    pthread_mutexattr_t attr = {0};
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(mutex, &attr);
    pthread_mutexattr_destroy(&attr);
    
    pthread_condattr_t condAtt={0};

    pthread_cond_init(&_condition, &condAtt);
    pthread_condattr_destroy(&condAtt);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initLock:&_lock];
        
//       dispatch_queue_t queue = dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
//        dispatch_async(queue, ^{
//            [self test2];
//        });
//        dispatch_async(queue, ^{
//            sleep(2);
//            [self test1];
//            
//        });
    }
    return self;
}


- (void)test1 {
    NSLog(@"%@",[NSThread currentThread]);
    pthread_mutex_lock(&_lock);
    NSLog(@"1");
    pthread_cond_signal( &_condition);
    NSLog(@"3");
    pthread_mutex_unlock(&_lock);
    NSLog(@"4");
}

- (void)test2 {
    NSLog(@"%@",[NSThread currentThread]);
    pthread_mutex_lock(&_lock);
    pthread_cond_wait(&_condition, &_lock);
    NSLog(@"2");
    pthread_mutex_unlock(&_lock);
}

//static int i = 0;

- (void)__saleTicket {
    pthread_mutex_lock(&_lock);
    [super __saleTicket];
//    i ++;
//    if (i > 5) {
//        NSLog(@"%d",i);
//        pthread_cond_broadcast(&_condition);
//    }
    pthread_mutex_unlock(&_lock);
}

- (void)__SaveMoney {
    pthread_mutex_lock(&_lock);
//    if (i <= 5) {
//        pthread_cond_wait(&_condition, &_lock);
//    }
//    
    [super __SaveMoney];
    pthread_mutex_unlock(&_lock);
}
- (void)__OutMoney {
    pthread_mutex_lock(&_lock);
//    if (i <= 5) {
//        pthread_cond_wait(&_condition, &_lock);
//    }
    [super __OutMoney];
    pthread_mutex_unlock(&_lock);
}
@end
