//
//  MementoExample.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 备忘录模式 是一种保存对象当前的状态，并在日后可以回复的模式。
 注意，它不会破坏对象的封装，也就是说，私有数据也能保存下来。
 
 其最经典的使用方法就是 NSUserDefaults 来读写，同时配合栈可以存储一系列状态。
 它经常用于初始化，重启，App前后台状态改变等地方。
 
 */

@interface MementoExample : NSObject

@end
