//
//  HHPayHeader.h
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#ifndef HHPayHeader_h
#define HHPayHeader_h
#import "HHCharge.h"

//----------------- 需要配置 -----------------
#define  HHPay_Scheme  @"HH_URL_Schemes"   //支付宝 银联需要在Info.plist URL_TYPES 里增加URL_Schemes
#define  HHWXAppId     @""                 //微信开发者ID
//-------------------------------------------


//回调Block
typedef void(^HHPayComplation)(BOOL success,NSString *message);


//protocol
@protocol HHPayProtocol<NSObject>

- (void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation;
- (BOOL)handleOpenURL:(NSURL *)url;

@end



#endif /* HHPayHeader_h */
