//
//  SRHash.m
//  哈希表
//
//  Created by iOS on 2019/8/26.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "SRHash.h"

@interface SRHash_t:NSObject
@property (nonatomic, assign) char *key;
@property (nonatomic, strong) NSObject *value;
@end
@implementation SRHash_t

@end


#define kCapacityBase 4

@interface SRHash()
@property (nonatomic, strong) NSMutableArray <SRHash_t *>* hashs;
@property (nonatomic, assign) NSInteger masks; // maks 数组长度-1
@property (nonatomic, assign) NSInteger occupied; //已缓存个数
@end

@implementation SRHash
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hashs = [self creatHashsWithCapacity:(kCapacityBase * 1)];
    }
    return self;
}


- (void) setHashValue:(id)value forKey:(NSString *)key {
    // 如果缓存个数超过数组长度 则扩容
    if (self.occupied > self.masks) {
        self.hashs = [self creatHashsWithCapacity:self.hashs.count * 2];
    }
    // NSString 转化为char  用char的地址存储
    char *charKey = [self formartKey:key];
    // 找到索引 通过&mask
    NSInteger beginIndex = [self findMask:charKey];
    
    NSInteger index = beginIndex;
    
    //发生碰撞
    if (![self isNil:self.hashs[index]] &&
        self.hashs[index].key != charKey) {
        // 不为空 && key不同
        do {
            //遍历数组。如果找到空位置/或者遍历一圈 跳出循环
            index = index - 1;
            index = (index < 0) ? index = self.masks : index;
            
        } while (![self isNil:[self objectFromHashs:index]] && beginIndex != index);
    }
    
    SRHash_t *hash = [SRHash_t new];
    hash.key = charKey;
    hash.value = value;
    self.hashs[index] = hash;
    
    // 存储个数+1
    self.occupied ++;

}

- (id)hashValueForKey:(NSString *)key {
    
    char *charKey = [self formartKey:key];
    
    NSInteger beginIndex = [self findMask:charKey];
    NSInteger index = beginIndex;
    
    SRHash_t *hash = [self objectFromHashs:index];
    
    if (![self isNil:hash] &&
        hash.key != charKey) {
        // 如果找到hash存在并且与key不等
        do {
            // 遍历 在遍历一个周期内 找到key相等的hash值
            index = index - 1;
            index = (index < 0) ? index = self.masks : index;
            hash = [self objectFromHashs:index];
            
        } while (hash.key != charKey && beginIndex != index);
        
        // 如果未找到
        if (hash.key != charKey) {
            return nil;
        }
    }
    
    return hash.value;
}

#pragma mark - private API
- (NSInteger) findMask:(char *) key {
  
    NSLog(@"%p",key);
    return ((long long)key) & _masks;
}
// 初始化数组 @""为空
- (NSMutableArray *) creatHashsWithCapacity:(NSInteger) capacity {
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:capacity];
    
    for (int i = 0 ; i < capacity; i ++) {
        [array addObject:@""];
    }
    _masks = array.count - 1;
    _occupied = 0;
    
    return array;
}

// 是否为空
- (BOOL) isNil:(id) hash {
    return [hash isKindOfClass:[NSString class]]  || hash == nil;
}

// 从数组中查找hash元素
- (SRHash_t *) objectFromHashs:(NSInteger) index {
    SRHash_t *temp = self.hashs[index];
    if ([temp isKindOfClass:[SRHash_t class]]) {
        return temp;
    }
    return nil;
}

- (char *) formartKey:(NSString *)key{
    return (char *)[key UTF8String];
}
@end


