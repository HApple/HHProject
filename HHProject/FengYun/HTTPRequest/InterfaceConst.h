//
//  InterfaceConst.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/7.
//  Copyright © 2017年 huang. All rights reserved.
//

#ifndef InterfaceConst_h
#define InterfaceConst_h


#define kLimitCount 20   //一页多少条

#define DevelopSever 0
#define TestSever    1
#define ProductSever 0

#if DevelopSever
/** 接口前缀-开发服务器*/
static NSString *const kApiPrefix = @"";
#elif TestSever
/** 接口前缀-测试服务器*/
static NSString *const kApiPrefix = @"";
#elif ProductSever
/** 接口前缀-生产服务器*/
static NSString *const kApiPrefix = @"";
#endif


/** 放置接口对应key */
static NSString *const kApiPreUrlKey      = @"kApiPreUrlKey";    //特殊接口，参数传入此值则会替代 kApiPrefix
static NSString *const kApiTailUrlKey     = @"kApiTailUrlKey";   //
static NSString *const kLoginKickOutKey   = @"kLoginKickOutKey"; //对应value放置BOOL值 NO代表遇到“请登录或重新登录”页面不跳转到首页 否则跳转到首页 默认YES
static NSString *const kInitCodeKey       = @"InitCode";



#pragma mark - 详细接口地址
/** 初始化*/
static NSString *const kInitCode = @"00000";
/** 登录*/
static NSString *const kLogin = @"10001";
/** 注册*/
static NSString *const kRegister = @"10002";
/** 退出*/
static NSString *const kExit = @"10020";

#endif /* HHInterfaceConst_h */
