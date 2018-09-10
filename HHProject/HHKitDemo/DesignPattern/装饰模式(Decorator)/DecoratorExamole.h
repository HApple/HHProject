//
//  DecoratorExamole.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
装饰模式 ： 它可以在不修改原代码的基础上进行拓展。
          注意它与继承最大的区别是：继承时，子类可以修改父类的行为，而装饰模式不希望如此。
 
 装饰模式是在不改变原封装的前提下，为对象动态添加新功能的模式。
 在 Objective-C 如 Category 和 Delegation
 
 
 装饰者模式，是面向对象编程领域中，一种动态地往一个类添加新的行为的设计模式。
 就功能而言，修饰模式相比生成子类更为灵活，这样可以给某个对象而不是整个类添加些功能
 
 遵循设计原则： 多用组合 ，少用继承。
 
 */


@interface DecoratorExample : NSObject

@end
