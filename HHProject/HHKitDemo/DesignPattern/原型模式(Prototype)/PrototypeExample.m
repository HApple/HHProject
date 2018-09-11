//
//  PrototypeExample.m
//  HHProject
//
//  Created by huang on 2018/9/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "PrototypeExample.h"

@implementation PrototypeExample
@end

@implementation BaseCopyObject

//子类不要重载这个方法
- (id)copyWithZone:(NSZone *)zone{
    BaseCopyObject *object = [[[self class] allocWithZone:zone] init];
    [self copyOperationWithObject:object]; //赋值操作
    return object;
}

//子类实现此方法， 实现赋值操作
- (void)copyOperationWithObject:(id)object{
    
}

@end

@implementation PTPerson
- (void)copyOperationWithObject:(PTPerson *)object {
    object.name = self.name;
    object.age = self.age;
}
//- (id)copyWithZone:(NSZone *)zone {
//    PTPerson *p = [[[self class] allocWithZone:zone] init];
//    p.name = self.name;//需要设置属性
//    p.age = self.age;
//    return p;
//}
@end

@implementation PTStudent
- (void)copyOperationWithObject:(PTStudent *)object {
    [super copyOperationWithObject:object];
    object.size = self.size;
    object.teacher = [self.teacher copy];
    object.address = self.address;
    object.friends = [[NSArray alloc] initWithArray:self.friends copyItems:YES];
    object.girlfriends = [[NSMutableArray alloc] initWithArray:self.girlfriends copyItems:YES];
    object.others = [NSKeyedUnarchiver unarchiveObjectWithData:
                     [NSKeyedArchiver archivedDataWithRootObject:self.others]];
}
@end
