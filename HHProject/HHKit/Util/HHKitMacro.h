//
//  HHKitMacro.h
//  HHProject
//
//  Created by Jn.Huang on 2017/5/25.
//  Copyright © 2017年 huang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <sys/time.h>
#import <pthread.h>

#ifndef HHKitMacro_h
#define HHKitMacro_h


#ifndef HHApp
#define HHApp      [UIApplication sharedApplication]
#endif

#ifndef HHAppDel
#define HHAppDel   ((AppDelegate *)HHApp.delegate)
#endif


#ifndef HHObjcIsNil
#define HHObjcIsNil(objc) ((objc) ? (NO) : (YES))
#endif

#ifndef HHGetMethodReturnObjc
#define HHGetMethodReturnObjc(objc) if (objc) return objc
#endif

#ifndef HHWS
#define HHWS(weakSelf) __weak __typeof(&*self)weakSelf = self
#endif


#ifdef DEBUG
#define HHLog(fmt, ...)   \
NSLog((@"[filename:%s]\n" "[functionname:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define HHLog(...);
#endif


#define  kAppVersion  ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])


#endif /* HHKitMacro_h */
