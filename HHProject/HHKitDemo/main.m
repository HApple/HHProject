//
//  main.m
//  HHProject
//
//  Created by Jn.Huang on 2017/5/23.
//  Copyright © 2017年 huang. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


//#import <Foundation/Foundation.h>
//#import "Cat.h"
//
////clang -rewrite-objc main.m
//
//int main(int argc, char * argv[]) {
//    Cat *c = [[Cat alloc] init];
//
//    Cat *c = ((Cat *(*)(id, SEL))(void *)objc_msgSend)((id)((Cat *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Cat"), sel_registerName("alloc")), sel_registerName("init"));
//}

