//
//  RecursiveLockDemo.m
//  GCD
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "RecursiveLockDemo.h"

@interface RecursiveLockDemo()
@property (nonatomic, strong) NSRecursiveLock *lock;
@end
@implementation RecursiveLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock = [[NSRecursiveLock alloc] init];
    }
    return self;
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
