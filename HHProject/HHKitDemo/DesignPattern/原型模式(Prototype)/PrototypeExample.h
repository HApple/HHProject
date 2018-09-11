//
//  PrototypeExample.h
//  HHProject
//
//  Created by huang on 2018/9/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 原型模式 (Prototype) : 是指使用原型实例指定创建对象的种类，并通过复制这
 个原型创建新的对象
 
 即：OC中可以通过深复制来快速而方便的创建一个新对象。
 
 */

@interface PrototypeExample : NSObject

@end


@interface BaseCopyObject : NSObject <NSCopying>

- (void)copyOperationWithObject:(id)object;

@end

@interface PTPerson : BaseCopyObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@end

@interface PTStudent : PTPerson

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) PTPerson *teacher;

@property (nonatomic, copy) NSArray *friends;

@property (nonatomic, strong) NSMutableArray *girlfriends;

@property (nonatomic, copy) NSArray *others;

@end
