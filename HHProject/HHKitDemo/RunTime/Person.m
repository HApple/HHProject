//
//  Person.m
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>



@interface Animal : NSObject
- (void)eat:(NSString *)food;
@end

@implementation Animal
- (void)eat:(NSString *)food{
    NSLog(@"xiaocao");
}
@end




/**
 OC方法 由哪几个部分组成
 SEL 方法编号
 IMP 方法指针 指向方法实现
 */

@interface Person()
@property (nonatomic,strong) Animal *animal;
@end

@implementation Person

- (instancetype)init{
    self = [super init];
    if (self) {
        self.animal = [[Animal alloc] init];
    }
    return self;
}

//消息转发三部曲
+ (BOOL)resolveInstanceMethod:(SEL)sel{

    if (sel == @selector(eat:)) {
        class_addMethod(self, sel, (IMP)eat, "");
        return YES;
    }else{
        return [super resolveInstanceMethod:sel];
    }
}

//OC方法的调用会传递两个隐式参数
// id self , SEL _cmd

void eat(id self,SEL _cmd,NSString *food){
    NSLog(@"eat %@",food);
}



-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    if (aSelector == @selector(eat:) && [self.animal respondsToSelector:@selector(eat:)]) {
        return self.animal;
    }
    return [super forwardingTargetForSelector:aSelector];
}





-(void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([self.animal respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self.animal];
    }else{
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [Animal instanceMethodSignatureForSelector:aSelector];
}

@end
