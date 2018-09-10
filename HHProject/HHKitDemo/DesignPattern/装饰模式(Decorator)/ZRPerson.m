//
//  ZRPerson.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "ZRPerson.h"

@implementation ZRPerson

- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)display{
    NSLog(@"装饰的%@",_name);
}

@end


@implementation ZRClothing

- (instancetype)initWithDecorate:(ZRPerson *)decorate{
    if (self = [super init]) {
        _decorate = decorate;
    }
    return self;
}

-(void)display{
    if (self.decorate) {
        [self.decorate display];
    }
}

@end


@implementation ZRTShirts


- (void)display{
    [super display];
    NSLog(@"大衬衫");
}
 
@end


@implementation ZRPants

- (void)display{
    [super display];
    NSLog(@"大裤衩");
}

@end

@implementation ZRTShoe

- (void)display
{
    [super display];
    NSLog(@"破鞋子");
}

@end



