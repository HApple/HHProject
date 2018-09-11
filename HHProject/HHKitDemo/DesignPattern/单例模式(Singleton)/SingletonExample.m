//
//  SingletonExample.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "SingletonExample.h"

@implementation SingletonExample

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static SingletonExample *singletonExample = nil;
    dispatch_once(&onceToken, ^{
        singletonExample = [[SingletonExample alloc] init];
    });
    return singletonExample;
}

@end
