//
//  FYResponseData.h
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 respCode    respMsg
 00000       SUCESS操作成功
 1           操作失败
 99999       非法请求必须初始化
 99990       请先登陆
 */
static NSString * const kRespCodeSuccess = @"00000";
static NSString * const kRespCodeFailure = @"1";
static NSString * const kRespCodeIllegal = @"99999";
static NSString * const kRespCodeReLogin = @"99990";

@interface FYResponseData : NSObject

@property (nonatomic,copy) NSString *respCode;
@property (nonatomic,copy) NSString *respMsg;
@property (nonatomic,strong) NSDictionary *respData;
@property (nonatomic,assign) BOOL success;


@end
