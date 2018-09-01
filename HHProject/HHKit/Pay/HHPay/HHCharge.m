//
//  HHCharge.m
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "HHCharge.h"
#import "HHPayHeader.h"

@implementation HHCharge

@end

@implementation HHWXCharge
-(instancetype)init{
    self = [super init];
    if (self) {
        self.chanel = HHPayChannel_WX;
    }
    return self;
}

@end

@implementation HHALiCharge
-(instancetype)init{
    self = [super init];
    if (self) {
        self.chanel = HHPayChannel_ALI;
        self.scheme = HHPay_Scheme;
    }
    return self;
}
@end

@implementation HHUnionCharge
-(instancetype)init{
    self = [super init];
    if (self) {
        self.chanel = HHPayChannel_UNION;
        self.scheme = HHPay_Scheme;
    }
    return self;
}
@end

@implementation HHUnionWebCharge
-(instancetype)init{
    self = [super init];
    if (self) {
        self.chanel = HHPayChannel_UNION_Web;
    }
    return self;
}
@end

