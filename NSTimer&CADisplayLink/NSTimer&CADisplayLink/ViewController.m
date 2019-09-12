//
//  ViewController.m
//  NSTimer&CADisplayLink
//
//  Created by iOS on 2019/9/9.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"
#import "SRProxy.h"
@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[SRProxy proxyWithTarget:self] selector:@selector(testForTimer) userInfo:nil repeats:YES];


}
- (void)testForTimer {
    NSLog(@"%s",__func__);
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"%s",__func__);
}

@end
