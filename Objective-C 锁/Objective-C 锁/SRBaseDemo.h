//
//  SRBaseDemo.h
//  GCD
//
//  Created by iOS on 2019/9/2.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRBaseDemo : NSObject
#pragma mark - Public API
- (void)saleTest;
- (void) saveOutTest;

#pragma mark - private API
- (void) __saleTicket;
- (void) __SaveMoney;
- (void) __OutMoney;
@end

NS_ASSUME_NONNULL_END
