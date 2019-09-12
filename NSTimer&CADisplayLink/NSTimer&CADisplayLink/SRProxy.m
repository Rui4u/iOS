//
//  SRProxy.m
//  NSTimer&CADisplayLink
//
//  Created by iOS on 2019/9/9.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SRProxy.h"
#import <objc/runtime.h>
@implementation SRProxy
+ (instancetype)proxyWithTarget:(id)target {
    SRProxy *proxy = [SRProxy alloc];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (self.target) {
        return self.target;
    }
    return self;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.target  methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
@end
