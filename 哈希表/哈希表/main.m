//
//  main.m
//  哈希表
//
//  Created by iOS on 2019/8/26.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRHash.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        SRHash *hash = [SRHash new];
  
        
        [hash setHashValue:@"哈哈哈1" forKey:@"1"];
        [hash setHashValue:@"哈哈哈2" forKey:@"2"];
        [hash setHashValue:@"哈哈哈1" forKey:@"3"];
        [hash setHashValue:@"哈哈哈2" forKey:@"4"];
        
        [hash setHashValue:@"哈哈哈1" forKey:@"5"];
        [hash setHashValue:@"哈哈哈2" forKey:@"6"];
        [hash setHashValue:@"哈哈哈1" forKey:@"7"];
        [hash setHashValue:@"哈哈哈2" forKey:@"8"];
        [hash setHashValue:@"哈哈哈1" forKey:@"1"];
        [hash setHashValue:@"哈哈哈2" forKey:@"2"];
        [hash setHashValue:@"哈哈哈1" forKey:@"3"];
        [hash setHashValue:@"哈哈哈2" forKey:@"4"];

   
        
        
        NSLog(@"value : %@",[hash hashValueForKey:@"1"]);
        NSLog(@"value : %@",[hash hashValueForKey:@"2"]);
        NSLog(@"value : %@",[hash hashValueForKey:@"3"]);
        NSLog(@"value : %@",[hash hashValueForKey:@"4"]);
        
    }
    return 0;
}
