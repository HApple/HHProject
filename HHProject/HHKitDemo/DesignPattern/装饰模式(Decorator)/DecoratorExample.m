//
//  DecoratorExample.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "DecoratorExample.h"
#import "ZRPerson.h"


@implementation DecoratorExample

- (instancetype)init{
    self = [super init];
    if (self) {
        
        ZRPerson *person = [[ZRPerson alloc] initWithName:@"huang"];
        ZRClothing *clothing = [[ZRClothing alloc] initWithDecorate:person];
        ZRTShirts *shirts = [[ZRTShirts alloc] init];
        ZRPants *pants = [[ZRPants alloc] init];
        ZRTShoe *shoe = [[ZRTShoe alloc] init];
        
        //装扮过程，相当于在室内穿衣服，控制器并不知道它是怎么的顺序
        shirts.decorate = clothing;
        pants.decorate = shirts;
        shoe.decorate = pants;
        [shoe display];
        
        
        //第二次装扮
        pants.decorate = clothing;
        shoe.decorate = pants;
        shirts.decorate = shoe;
        [shirts display];
        
        
    }
    return self;
}


@end
