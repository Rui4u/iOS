//
//  SRPermanentThread.m
//  RunLoop
//
//  Created by iOS on 2019/8/30.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SRPermanentThread.h"
@interface SRThread : NSThread

@end

@implementation SRThread
- (void)dealloc {
    NSLog(@"%s",__func__);
}
@end

@interface SRPermanentThread()
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign, getter=isStop) BOOL stop;

@end
@implementation SRPermanentThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self;
        self.stop = NO;
        self.thread = [[SRThread alloc] initWithBlock:^{
            //c实现方式
            // 参考源码 第二个参数 足够大的书
            // 第三个参数是 执行完source后是否退出
            
            
            CFRunLoopSourceContext context = {0};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            CFRunLoopRef runloop = CFRunLoopGetCurrent();
            CFRunLoopAddSource(runloop, source, kCFRunLoopDefaultMode);
            
            while (!weakSelf.isStop && weakSelf) {
                CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1E30, true);
            }
            
            
            CFRelease(source);
            
//             oc版本
//            [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
//            while (!weakSelf.isStop && weakSelf) {
//                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//            }
        }];
    }
    return self;
}

- (void)run {
    if (!self.thread)  return;
    
    [self.thread start];
}

- (void)executeTask:(void (^)(void))task {
    if (!task || !self.thread) {
        return;
    }
    [self performSelector:@selector(__run:) onThread:self.thread withObject:task waitUntilDone:NO];
    
}

- (void)stop {
    if (self.thread) {
        [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
        NSLog(@"任务停止");
    }
}

#pragma mark - private Api

- (void)__run:(SRPermanentThreadBlock) task {
    if (task) {
        task();
    }
}
- (void)__stop {
    self.stop = YES;
    self.thread = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

- (void)dealloc {
    [self stop];
    NSLog(@"%s",__func__);
}
@end
