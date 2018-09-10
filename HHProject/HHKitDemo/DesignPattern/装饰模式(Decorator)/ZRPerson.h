//
//  ZRPerson.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRPerson : NSObject
{
    @protected
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name;
- (void)display;
@end




@interface ZRClothing : ZRPerson

@property (nonatomic,strong) ZRPerson   *decorate;


- (instancetype)initWithDecorate:(ZRPerson *)decorate;

@end


@interface ZRTShirts : ZRClothing

@end


@interface ZRPants : ZRClothing

@end


@interface ZRTShoe : ZRClothing

@end
