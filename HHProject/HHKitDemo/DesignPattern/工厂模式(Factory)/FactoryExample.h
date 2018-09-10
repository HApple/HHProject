//
//  FactoryExample.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

// <http://ibloodline.com/articles/2016/09/06/factory.html>

/**
 工厂模式分为简单工厂模式和抽象工厂模式
 工厂方法是抽象工厂模式的组成部分
 */

#import <Foundation/Foundation.h>

@interface FactoryExample : NSObject

@end


/* 简单工厂模式
 通过工厂类根据参数负责创建具体的产品，即工厂类在工厂方法中通过对参数进行条件判断(if switch)来创建不同的实例)
 
 简单工厂模式的主要参与者：
 工厂 （Factory）角色：           接受客户端的请求，通过请求创建相应的产品对象。
 抽象产品（AbstractProduct）角色： 是工厂模式所创建对象的父类或是共同拥有的接口。可以是抽象类或接口
 具体产品 (ConcreteProduct) 对象: 工厂模式所创建的对象都是这个角色的实例。
 */

typedef NS_ENUM(NSInteger,SFProductType) {
    SFProductTypeOne,
    SFProductTypeTwo,
    SFProductTypeThree
};


@interface  SFProduct : NSObject
@end

@interface  SFProductOne : SFProduct
@end

@interface  SFProductTwo :  SFProduct
@end

@interface  SFProductThree :  SFProduct
@end

@interface  SFProductFactory : NSObject
+ (SFProduct *)createProductWithType:(SFProductType)type;
+ (SFProduct *)createProductWithTypeStr:(NSString *)productStr;
+ (SFProduct *)createProductWithClass:(Class)productClass;
@end



/**
 工厂方法 (Factory) : 定义创建对象的接口，让子类决定实例化哪一个类。工厂方法使得一个类的实例化延迟到其子类。
 也就是说
 工厂方法模式将之前负责生成具体抽象子类的工厂类，抽象为工厂抽象类和工厂子类组成的一系列类。
 每创建一个抽象子类，就需要创建一个工厂子类，并且一一对应，由工厂子类去生成对应的多抽象子类，
 由外界使用方法来决定生成哪个工厂子类。这样在增加新的需求时，就不需要对工厂抽象类进行修改，
 而是对应新增的抽象子类创建对应的工厂子类即可。
 
 
 主要参与者：
 抽象工厂角色： 与应用程序无关，任何在模式中创建对象的工厂必须实现这个接口。
 
 具体工厂角色： 实现了抽象工厂接口的具体类，含有引用密切相关的逻辑，并且
 受到应用程序的调用以创建产品对象。
 
 抽象产品角色： 工厂方法所创建产品对象的超类型，也就是产品对象的共同父类或共同拥有的接口
 
 具体产品角色： 这个角色实现了抽象产品角色所声明的接口。工厂方法所创建的每个具体产品对象
 都是某个具体产品角色的实例。
 
*/

//抽象产品
@interface FMProduct : NSObject
@end

//具体产品1
@interface FMProductOne : FMProduct
@end

//具体产品2
@interface FMProductTwo : FMProduct
@end

//抽象工厂
@interface FMFactory : NSObject
+ (FMProduct *)createProduct;
@end

//具体产品1的具体工厂
@interface FMProductOneFacotry : FMFactory
@end


//具体产品2的具体工厂
@interface FMProductTwoFactory : FMFactory
@end


/**
 抽象工厂模式
 提供了创建一系列相关抽象子类的接口，而无需指定它们具体的类型。也叫做Kit模式。
   
 
 
 
 */






