//
//  SynchoronizedDemo.m
//  GCD
//
//  Created by iOS on 2019/9/3.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SynchoronizedDemo.h"

@implementation SynchoronizedDemo

- (void)__saleTicket {
    @synchronized (self) {
         [super __saleTicket];
    }
}

- (void)__SaveMoney {
    @synchronized (self) {
         [super __SaveMoney];
    }
}
- (void)__OutMoney {
    @synchronized (self) {
        [super __OutMoney];
    }
}
@end
