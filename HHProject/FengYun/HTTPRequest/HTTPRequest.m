//
//  HTTPRequest.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/7.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HTTPRequest.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation HTTPRequest

/*
 配置好HHNetworkHelper各项请求参数,封装成一个公共方法,给以上方法调用,
 相比在项目中单个分散的使用HHNetworkHelper/其他网络框架请求,可大大降低耦合度,方便维护
 在项目的后期, 你可以在公共请求方法内任意更换其他的网络请求工具,切换成本小
 */

#pragma mark - 请求的公共方法
+ (NSURLSessionTask *)requestWithParameters:(NSDictionary *)parameter
                                    success:(HHRequestSuccess)success
                                    failure:(HHRequestFailure)failure{
    
    return [self requestWithParameters:parameter success:success failure:failure showLoading:YES];
}

+ (NSURLSessionTask *)requestWithParameters:(NSDictionary *)parameter
                                    success:(HHRequestSuccess)success
                                    failure:(HHRequestFailure)failure
                                showLoading:(BOOL)show{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    
    if (![dic objectForKey:kLoginKickOutKey]) {
        [dic setObject:kLoginKickOutKey forKey:@(YES)];
    }

    NSString *tail = [dic objectForKey:kApiTailUrlKey]?:@"";
    if(tail.length > 0){
        [dic removeObjectForKey:kApiTailUrlKey];
    }
    
    NSString *apiPre = kApiPrefix;
    NSString *prefix = [dic objectForKey:kApiPreUrlKey]?:@"";
    if (prefix.length > 0) {
        apiPre = prefix;
    }
    
    
//    NSString *tokenid = [DataManager sharedMgr].userData.tokenId;
//    if (tokenid) {
//        [dic setObject:tokenid forKey:@"tokenId"];
//    }
    
    HHLog(@"parameter %@",dic);
    NSString *url = [NSString stringWithFormat:@"%@%@",apiPre,tail];
    HHLog(@"url %@",url);
    if (show) {
        [HHProgressHUD showLoading];
    }
    
    
    return [self requestWithURL:url parameters:dic requestType:HTTPRequestPost success:^(FYResponseData *responseData) {
        
        [HHProgressHUD hideLoading];
        
        if (success) {
            success(responseData);
        }
        
    } failure:^(NSError *error) {
        
        [HHProgressHUD hideLoading];
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter requestType:(HTTPRequestType)requestType success:(HHRequestSuccess)success failure:(HHRequestFailure)failure
{
    NSString *encodeURL = [URL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    
    // 设置请求头
    if ([LoginManager sharedMgr].sessionid) {
        [HHNetworkHelper setValue:[LoginManager sharedMgr].sessionid forHTTPHeaderField:@"cookie"];
        
    }else{
        [HHNetworkHelper clearHttpCookieStoage];
    }
    
    // 发起请求
    if (requestType == HTTPRequestGet) {
        
        return [HHNetworkHelper GET:encodeURL parameters:parameter success:^(id responseObject) {
            
            BOOL kickOut = [[parameter objectForKey:kLoginKickOutKey] boolValue];
            [self handleResult:responseObject success:success kickOut:kickOut];
            
        } failure:^(NSError *error) {
            
            if (failure) {
                failure(error);
            }
        }];
        
        
    }else{
        return [HHNetworkHelper POST:encodeURL parameters:parameter success:^(id responseObject) {
            
            BOOL kickOut = [[parameter objectForKey:kLoginKickOutKey] boolValue];
            [self handleResult:responseObject success:success kickOut:kickOut];
            
        } failure:^(NSError *error) {
            
            if (failure) {
                failure(error);
            }
        }];
    }
    return nil;
}


+ (void)handleResult:(id)responseObject success:(HHRequestSuccess)success kickOut:(BOOL)kickOut{
    
    
    if ([responseObject isKindOfClass:[NSDictionary class]] && kickOut) {
        NSString *msg = responseObject[@"msg"];
        if (![msg isKindOfClass:[NSNull class]] && [msg isEqualToString:@"请登录或重新登录"]) {
            
            [HHProgressHUD hideLoading];
            [HHProgressHUD showMessage:msg];
            //清除数据 跳转到首页
            [[LoginManager sharedMgr] logOut];
            
            if (success) {
                success(nil);
            }
            return;
        }
    }
    
    if ([responseObject isKindOfClass:[NSDictionary class]] && responseObject[@"obj"]) {
        
        FYResponseData *respData = [[FYResponseData alloc] init];
        respData.respCode = responseObject[@"code"];
        respData.respMsg = responseObject[@"msg"];
        respData.respData = responseObject[@"obj"];
        if ([responseObject[@"obj"] isKindOfClass:[NSNull class]]) {
            respData.respData = nil;
        }
        respData.success = responseObject[@"success"];
        NSInteger  suc = [responseObject[@"success"] integerValue];
        if (suc == 0) {
            respData.success = NO;
        }else{
            respData.success = YES;
        }
        if (success) {
            success(respData);
        }
        
    }
    else{
        
        FYResponseData *respData = [[FYResponseData alloc] init];
        respData.respCode = @"";
        respData.respMsg = @"";
        respData.respData = responseObject;
        respData.success = YES;
        if (success) {
            success(respData);
        }
        
    }
}


+ (void)getImageBodyWithParameters:(NSDictionary *)parameter
                           success:(HHRequestImageSuccess)success
                           failure:(HHRequestFailure)failure
                       showLoading:(BOOL)show{
    
    if (show) {
        [HHProgressHUD showLoading];
    }
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    // 设置请求的超时时间
    sessionManager.requestSerializer.timeoutInterval = 30.f;
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*",@"image/jpeg", nil];
    // 打开状态栏的等待菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    NSString *tail = [dic objectForKey:kApiTailUrlKey]?:@"";
    if (tail.length > 0) {
        [dic removeObjectForKey:kApiTailUrlKey];
    }
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,tail];
    [sessionManager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [HHProgressHUD hideLoading];
        
        UIImage *image = [UIImage imageWithData:responseObject];
        if (success) {
            success(image);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [HHProgressHUD hideLoading];
        if (failure) {
            failure(error);
        }
    }];
    
}
@end
