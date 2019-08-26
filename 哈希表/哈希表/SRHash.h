//
//  SRHash.h
//  哈希表
//
//  Created by iOS on 2019/8/26.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRHash : NSObject
- (void) setHashValue:(id)value forKey:(NSString *)key;
- (id)hashValueForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
