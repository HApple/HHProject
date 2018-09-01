//
//  HHALiPay.m
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "HHALiPay.h"
#import <AlipaySDK/AlipaySDK.h>

@interface HHALiPay ()

@property (nonatomic,copy) HHPayComplation complation;

@end

@implementation HHALiPay


#pragma mark - HHPayProtocol
-(void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation{
    
    self.complation = complation;
    
    HHALiCharge *aliCharge = (HHALiCharge *)charge;
    
    [[AlipaySDK defaultService] payOrder:aliCharge.orderNo fromScheme:aliCharge.scheme callback:^(NSDictionary *resultDic) {
        [self handlePayResult:resultDic];
    }];
}


-(BOOL)handleOpenURL:(NSURL *)url{

    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            [self handlePayResult:resultDic];
        }];
        
    }
    return YES;
}


#pragma mark - private methods
/*
 9000    订单支付成功
 8000    正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
 4000    订单支付失败
 5000    重复请求
 6001    用户中途取消
 6002    网络连接出错
 6004    支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
 其它     其它支付错误
 */
- (void)handlePayResult:(NSDictionary *)resultDic{
    NSString *state = [NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]];
    BOOL success = NO;
    NSString *msg = @"";
    if ([state isEqualToString:@"9000"]) {
        
        success = YES;
        msg = @"订单支付成功";
        
    }else if([state isEqualToString:@"8000"]){
        
        msg = @"正在处理中，支付结果未知";
        
    }else if([state isEqualToString:@"4000"]){
        
        msg = @"订单支付失败";
        
    }else if([state isEqualToString:@"5000"]){
        
        msg = @"重复请求";
        
    }else if([state isEqualToString:@"6001"]){
        
        msg = @"用户中途取消";
        
    }else if([state isEqualToString:@"6002"]){
        
        msg = @"网络连接出错";
        
    }else if([state isEqualToString:@"6004"]){
        
        msg = @"支付结果未知";
        
    }else {
        
        msg = @"其它支付错误";
    }
    if (self.complation) {
        self.complation(success, msg);
    }
    
}
@end
