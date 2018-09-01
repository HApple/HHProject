//
//  NSURL+HOOK.m
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "NSURL+HOOK.h"
#import <objc/runtime.h>

/**
 利用Runtime 改变方法调用顺序
 */
@implementation NSURL (HOOK)

+ (void)load{
    
    //获取两个Method
    Method URLWithStr = class_getClassMethod(self, @selector(URLWithString:));
    Method HKWithStr = class_getClassMethod(self, @selector(HK_URLWithString:));
    
    //交换方法的IMP
    method_exchangeImplementations(URLWithStr, HKWithStr);
    
}


+ (instancetype)HK_URLWithString:(NSString *)URLString{
    NSURL *url = [NSURL HK_URLWithString:URLString];
    if (!url) {
        NSLog(@"空了");
    }
    return url;
}


@end
