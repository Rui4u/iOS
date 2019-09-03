//
//  SRBaseDemo.m
//  GCD
//
//  Created by iOS on 2019/9/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SRBaseDemo.h"
@interface SRBaseDemo()
@property (nonatomic, assign) NSInteger ticktesCount;
@property (nonatomic, assign) NSInteger money;
@property (nonatomic, strong) NSString *currentTime;
@end
@implementation SRBaseDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Public API
- (void)saleTest {
    self.ticktesCount = 7500000;
    self.currentTime = [self currentTimeStr];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 2500000; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 2500000; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 2500000; i++) {
            [self __saleTicket];
        }
    });
}


- (void) saveOutTest {
    self.money = 100;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            [self __SaveMoney];
        }
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            [self __OutMoney];
        }
    });
}

#pragma mark - private API
- (void) __saleTicket{
    sleep(.2);
    self.ticktesCount--;;
//    NSLog(@"剩余票数:%zd",self.ticktesCount);
    if (self.ticktesCount == 0) {
        NSLog(@"%@消耗时间:%ld",NSStringFromClass([self class]),([self currentTimeStr].integerValue) - self.currentTime.integerValue);
    }
}

- (void) __SaveMoney{
    sleep(.2);
    self.money += 50;
    NSLog(@"存钱:账户金额%zd",self.money);
}

- (void) __OutMoney{
    sleep(.2);
    self.money -= 30;

    NSLog(@"取钱:账户金额%zd",self.money);
}

//获取当前时间戳
- (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time= [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}
@end
