//
//  HHHTTPRequest.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/7.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHNetworkHelper.h"
#import "InterfaceConst.h"
#import "FYResponseData.h"
#import "LoginManager.h"


typedef NS_ENUM(NSInteger,HTTPRequestType){
    HTTPRequestPost,
    HTTPRequestGet
};

/*
 以下Block的参数你根据自己项目中的需求来指定, 这里仅仅是一个演示的例子
 */

/**
 请求成功的block
 @param responseData 响应体数据
 */
typedef void(^HHRequestSuccess)(FYResponseData *responseData);

/**
 请求失败的block
 */
typedef void(^HHRequestFailure)(NSError *error);


/**
 请求图片成功的block
 */
typedef void (^HHRequestImageSuccess)(UIImage *image);


@interface HTTPRequest : NSObject

/**
 默认请求 kApiPrefix 地址
 json格式返回
 带有Loading加载框
 */
+ (NSURLSessionTask *)requestWithParameters:(NSDictionary *)parameter
                                    success:(HHRequestSuccess)success
                                    failure:(HHRequestFailure)failure;

+ (NSURLSessionTask *)requestWithParameters:(NSDictionary *)parameter
                                    success:(HHRequestSuccess)success
                                    failure:(HHRequestFailure)failure
                                showLoading:(BOOL)show;

/**
 获取图片用此
 */
+ (void)getImageBodyWithParameters:(NSDictionary *)parameter
                           success:(HHRequestImageSuccess)success
                           failure:(HHRequestFailure)failure
                       showLoading:(BOOL)show;
@end
