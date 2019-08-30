//
//  SRPermanentThread.h
//  RunLoop
//
//  Created by iOS on 2019/8/30.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SRPermanentThreadBlock)(void);
@interface SRPermanentThread : NSObject
- (void) run;
- (void) stop;
- (void) executeTask:(SRPermanentThreadBlock)task;
@end

NS_ASSUME_NONNULL_END
