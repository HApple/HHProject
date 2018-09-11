//
//  SingletonExample.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 单例
 很常用也很简单，保证一个类仅有一个实例，
 
 很多场景都运用到了如本代码中的LoginManager
 
在 Objective-C 如
 [NSUserDefaults standardUserDefaults]
 [UIApplication sharedApplication]
 [UIScreen mainScreen]
 
 */

@interface SingletonExample : NSObject

+ (instancetype)sharedInstance;



@end
