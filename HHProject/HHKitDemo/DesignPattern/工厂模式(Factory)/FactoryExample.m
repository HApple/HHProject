//
//  FactoryExample.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "FactoryExample.h"

@implementation FactoryExample

- (instancetype)init{
    self = [super init];
    if (self) {
        
       //简单工厂方法
       SFProduct *spP1 =  [SFProductFactory createProductWithClass:SFProductOne.class];
       NSLog(@"%@",spP1);
        
       //工厂方法
       FMProduct *fmp1 = [FMProductOneFacotry createProduct];
       NSLog(@"%@",fmp1);
       
       FMProduct *fmp2 = [FMProductTwoFactory createProduct];
       NSLog(@"%@",fmp2);
    }
    return self;
}

@end


#pragma mark - 简单工厂方法
@implementation SFProduct
@end

@implementation SFProductOne
@end

@implementation SFProductTwo
@end

@implementation SFProductThree
@end

@implementation SFProductFactory
+ (SFProduct *)createProductWithType:(SFProductType)type{
    switch (type) {
        case SFProductTypeOne:
            return [[SFProductOne alloc] init];
            break;
        case SFProductTypeTwo:
            return [[SFProductTwo alloc] init];
            break;
        case SFProductTypeThree:
            return [[SFProductThree alloc] init];
            break;
        default:
            break;
    }
    return nil;
}

/**
 理解起来比较简单，但是有一个问题--由于简单工厂模式不仅对拓展开放，而且对修改也开放。所以违反了“开放-关闭原则”。
 也就是 当需要拓展一个产品时，不仅需要新建一个产品类，同时还要修改工厂方法。另外，所有产品对象创建的逻辑都被集中
 到了工厂类中，并不优雅。OC中可以使用runtime来进行优化。
 */

//使用字符串参数
+ (SFProduct *)createProductWithTypeStr:(NSString *)productStr{
    if (!productStr || productStr.length == 0) {
        return nil;
    }
    Class class = NSClassFromString(productStr);
    SFProduct *p = [[class alloc] init];
    if (p) {
        return p;
    }
    return nil;
}

// 使用类型参数
+ (SFProduct *)createProductWithClass:(Class)productClass{
    if (!productClass) {
        return nil;
    }
    SFProduct *p = [[productClass alloc] init];
    if (p) {
        return p;
    }
    return nil;
}
@end


#pragma mark - 工厂方法
//抽象产品
@implementation FMProduct
@end

//具体产品1
@implementation FMProductOne
@end

//具体产品2
@implementation FMProductTwo
@end

//抽象工厂
@implementation FMFactory
+ (FMProduct *)createProduct{
    return [[FMProduct alloc] init];
}
@end

//具体产品1的具体工厂
@implementation FMProductOneFacotry
+ (FMProduct *)createProduct{
    return [[FMProductOne alloc] init];
}
@end


//具体产品2的具体工厂
@implementation FMProductTwoFactory
+ (FMProduct *)createProduct{
    return [[FMProductTwo alloc] init];
}
@end
