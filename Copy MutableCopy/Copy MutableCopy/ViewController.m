//
//  ViewController.m
//  Copy MutableCopy
//
//  Created by iOS on 2019/9/12.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *a = [NSString stringWithFormat:@"abc"];
    NSLog(@"a retainCount = %ld",[a retainCount]);
    
    NSString *b = [a copy];
    NSLog(@"a retainCount = %ld",[a retainCount]);
    
    NSString *c = [a mutableCopy];
    
    NSLog(@"%@,%@,%@",a,b,c);
    NSLog(@"%p,%p,%p",a,b,c);
    
}


@end
