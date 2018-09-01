//
//  HHWXPay.m
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "HHWXPay.h"
#import "WXApi.h"

@interface HHWXPay ()<WXApiDelegate>

@property (nonatomic,copy) HHPayComplation complation;
@end


@implementation HHWXPay

- (instancetype)init{
    self = [super init];
    if(self){
        BOOL isSuccess = [WXApi registerApp:HHWXAppId];
        if(isSuccess){
            NSLog(@"WXApi 注册成功");
        }
    }
    return self;
}


#pragma mark - HHPayProtocol
- (void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation{
    
    self.complation = complation;
    
    HHWXCharge *wxCharge = (HHWXCharge *)charge;
    
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = wxCharge.partnerId; //商家id
    request.prepayId =  wxCharge.prepayId ;  //订单id
    request.nonceStr =  wxCharge.nonceStr;   //随机数
    request.package =  wxCharge.package;
    request.timeStamp =  wxCharge.timeStamp; //时间戳
    request.sign =  wxCharge.sign;//签名
    [WXApi sendReq:request];

}


-(BOOL)handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate
/**
enum  WXErrCode {
WXSuccess           = 0,    //< 成功
WXErrCodeCommon     = -1,   //< 普通错误类型
WXErrCodeUserCancel = -2,   //< 用户点击取消并返回
WXErrCodeSentFail   = -3,   //< 发送失败
WXErrCodeAuthDeny   = -4,   //< 授权失败
WXErrCodeUnsupport  = -5,   //< 微信不支持
};
*/
- (void)onResq:(BaseResp *)resp{
    if ([resp isKindOfClass:[PayResp class]]) {
        PayResp *response = (PayResp *)resp;
        BOOL success = NO;
        NSString *msg = @"";
        switch (response.errCode) {
            case WXSuccess:
                success = YES;
                msg = @"支付成功";
                break;
            case WXErrCodeCommon:
                msg = @"普通错误类型";
                break;
            case WXErrCodeUserCancel:
                msg = @"用户取消支付";
                break;
            case WXErrCodeSentFail:
                msg = @"发送失败";
                break;
            case WXErrCodeAuthDeny:
                msg = @"授权失败";
                break;
            case WXErrCodeUnsupport:
                msg = @"微信不支持";
                break;
            default:
                break;
        }
        
        if (self.complation) {
            self.complation(success, msg);
        }
        
    }
}


@end
