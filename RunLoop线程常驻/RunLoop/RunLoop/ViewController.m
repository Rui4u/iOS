//
//  ViewController.m
//  RunLoop
//
//  Created by iOS on 2019/8/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"
#import "SRPermanentThread.h"

@interface ViewController ()
@property (nonatomic, strong) SRPermanentThread *thread;
@end

@implementation ViewController
- (IBAction)stop:(id)sender {
    [self.thread stop];
}

- (IBAction)start:(id)sender {
    
    [self.thread executeTask:^{
        NSLog(@"任务开始  =  %@",[NSThread currentThread]);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thread = [[SRPermanentThread alloc] init];
    [self.thread run];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
