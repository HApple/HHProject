//
//  LoginManager.h
//  XiangZhiGou
//
//  Created by huang on 2018/3/7.
//  Copyright © 2018年 徐岸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyInfoModel.h"
#import "FYResponseData.h"
#import "HTTPRequest.h"
#import "NewEditionTestManager.h"
#import "RHLocation.h"

/*
 对应项目的真实登录界面名称
 退出到登录界面会用到
 */
static NSString * const kLoginClassName = @"LoginViewController";


@interface LoginManager : NSObject

@property (nonatomic, assign) BOOL login;
@property (nonatomic, copy, readonly) NSString *account;
@property (nonatomic, copy, readonly) NSString *password;
@property (nonatomic, strong) MyInfoModel *infoModel;


//当App启动定位时才会有值 参考 "AppDelegate+Location"
@property (nonatomic,strong) Location *location;


//初始化 和 登录后 返回数据 统一放在以下的字段
@property (nonatomic,copy) NSString *sessionid;


+ (instancetype)sharedMgr;

- (void)updatePassword:(NSString *)password;

- (void)saveAccount:(NSString *)account
           password:(NSString *)password;

- (void)logOut;

/** 初始化接口*/
+ (void)initializeInterface:(void (^)(FYResponseData *data))block;

@end
