//
//  HHPayEngine.h
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//
//   支付宝依赖库添加 https://docs.open.alipay.com/204/105295/
//   微信开发步骤    https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=8_5
//   微信依赖库添加:  SystemConfiguration.framework,libz.dylib,libsqlite3.0.dylib。
//
//
//  注意!!
//  Pay -> SDK -> WechtSDK1.8.2  这个库没有引入工程 因为pod里已经有了
//  银联网页版本直接调用 HHWKWebViewController
//

#import <Foundation/Foundation.h>
#import "HHPayHeader.h"
#import "HHALiPay.h"
#import "HHWXPay.h"
#import "HHUnionPay.h"

@interface HHPayEngine : NSObject

+ (instancetype)sharedEngine;

/*
 调用举例
 如微信支付
 HHWXCharge *charge = [[HHWXCharge alloc] init];
 charge.partnerId = @""; //根据服务器返回的数据填充各个属性
 ....
 [[HHPayEngine sharedEngine] payWithCharge:charge
                             controller:self
                         withComplation:^(BOOL success,NSString *message){
 
                        }
 ];
 */
- (void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation;

//在Appdelegate的 handleOpenURL...里调用此方法
- (BOOL)handleOpenURL:(NSURL *)url;
@end
