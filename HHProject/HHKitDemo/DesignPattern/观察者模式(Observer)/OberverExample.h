//
//  OberverExample.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 观察者模式 ：定义对象间的一种一对多依赖关系，使得每当一个对象状态发生改变时，其相关依赖对象皆得到通知并自动更新。
 
在 Objective-C 如
 NSNotificationCenter
 KVO
 就是观察者模式
 
 */

@interface Boss : NSObject

@property (nonatomic,assign) NSInteger outState;

@end

@interface Employee : NSObject

@end





@interface OberverExample : NSObject

@end
