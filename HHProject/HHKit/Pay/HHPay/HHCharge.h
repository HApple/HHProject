//
//  HHCharge.h
//  HTL
//
//  Created by huang on 2018/8/30.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import <Foundation/Foundation.h>

//Pay Channel
typedef NS_ENUM(NSUInteger,HHPayChannel){
    HHPayChannel_WX,        //微信
    HHPayChannel_ALI,       //支付宝
    HHPayChannel_UNION,     //银联
    HHPayChannel_UNION_Web, //银联网页
};

@interface HHCharge : NSObject

@property (nonatomic,assign) HHPayChannel chanel;
@property (nonatomic,copy) NSString *scheme;

@end

//微信
@interface HHWXCharge : HHCharge
@property (nonatomic,copy) NSString *partnerId; //商家id
@property (nonatomic,copy) NSString *prepayId;  //订单id
@property (nonatomic,copy) NSString *nonceStr; //随机数
@property (nonatomic,assign) UInt32 timeStamp;  //时间戳
@property (nonatomic,copy) NSString *package;   //
@property (nonatomic,copy) NSString *sign;      //签名
@end

//支付宝
@interface HHALiCharge : HHCharge
@property (nonatomic,copy) NSString *orderNo;
@end


//银联
@interface HHUnionCharge : HHCharge
@property (nonatomic,copy) NSString *tn;
@property (nonatomic,copy) NSString *mode;
@end

//银联网页
@interface HHUnionWebCharge : HHCharge
@property (nonatomic,copy) NSString *htmlStr;
@end
