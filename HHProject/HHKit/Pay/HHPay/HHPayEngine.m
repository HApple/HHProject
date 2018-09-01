//
//  HHPayEngine.m
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//


#import "HHPayEngine.h"


@interface HHPayEngine ()

@property (nonatomic,strong) id<HHPayProtocol> payChanel;

@end


@implementation HHPayEngine

+(instancetype)sharedEngine{
    static HHPayEngine* payEngine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        payEngine = [[self alloc] init];
    });
    return payEngine;
}

- (void)payWithCharge:(HHCharge *)charge contoller:(UIViewController *)controller withComplation:(HHPayComplation)complation{
    
    if (controller == nil) {
        complation(NO,@"ViewController不能为nil");
        return;
    }
    
    switch (charge.chanel) {
        case HHPayChannel_WX:
        {
            self.payChanel = [[HHWXPay alloc] init];
        }
            break;
        case HHPayChannel_ALI:
        {
            self.payChanel = [[HHALiPay alloc] init];
        }
            break;
        case HHPayChannel_UNION:
        {
            self.payChanel = [[HHUnionPay alloc] init];
        }
            break;
        default:
            break;
    }

    if (self.payChanel == nil) {
        complation(NO,@"支付类型错误");
        return;
    }
    [self.payChanel payWithCharge:charge contoller:controller withComplation:complation];
    
}

- (BOOL)handleOpenURL:(NSURL *)url{
    return [self.payChanel handleOpenURL:url];
}


@end
