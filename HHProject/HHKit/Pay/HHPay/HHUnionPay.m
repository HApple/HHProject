//
//  HHUnionPay.m
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "HHUnionPay.h"
#import "UPPaymentControl.h"

@interface HHUnionPay ()

@property (nonatomic,copy) HHPayComplation complation;

@end


@implementation HHUnionPay

-(void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation{
    
    self.complation = complation;
    
    HHUnionCharge *unionCharge = (HHUnionCharge *)charge;

    BOOL isSuccess = [[UPPaymentControl defaultControl] startPay:unionCharge.tn
                                                      fromScheme:unionCharge.scheme
                                                            mode:unionCharge.mode
                                                  viewController:controller];
    if (!isSuccess) {
        self.complation(NO,@"调起银联支付失败");
    }
}


-(BOOL)handleOpenURL:(NSURL *)url{
    
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
        
        if ([code isEqualToString:@"success"]) { //结果code为成功时，去商户后台查询一下确保交易是成功的再展示成功
            
            self.complation(YES,@"支付成功");
        
        }else if([code isEqualToString:@"fail"]){ //交易失败
            
            self.complation(NO, @"交易失败");
            
        }else if([code isEqualToString:@"cancel"]){ //交易取消
            
            self.complation(NO, @"交易取消");
        }
    }];
    
    return YES;
}


@end
