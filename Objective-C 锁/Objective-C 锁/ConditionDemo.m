//
//  ConditionDemo.m
//  GCD
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ConditionDemo.h"
@interface ConditionDemo()
@property (nonatomic, strong) NSCondition *lock;
@end
@implementation ConditionDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock = [[NSCondition alloc] init];
        
//        dispatch_queue_t queue = dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
//        dispatch_async(queue, ^{
//            [self test2];
//        });
//        dispatch_async(queue, ^{
//            sleep(20);
//            [self test1];
//            
//        });
    }
    return self;
}

- (void)test1 {
    NSLog(@"%@",[NSThread currentThread]);
    [self.lock lock];
    NSLog(@"1");
    [self.lock signal];
    NSLog(@"3");
    [self.lock unlock];
    NSLog(@"4");
}

- (void)test2 {
    NSLog(@"%@",[NSThread currentThread]);
    [self.lock lock];
    [self.lock waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
    NSLog(@"2");
    [self.lock unlock];
}
- (void)__saleTicket {
    [self.lock lock];
    [super __saleTicket];
    [self.lock unlock];
}

- (void)__SaveMoney {
    [self.lock lock];
    [super __SaveMoney];
    [self.lock unlock];
}
- (void)__OutMoney {
    [self.lock lock];
    
    [super __OutMoney];
    [self.lock unlock];
}
@end
