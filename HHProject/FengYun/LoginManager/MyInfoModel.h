//
//  MycenterInfoModel.h
//  NNtongbao
//
//  Created by NNCai on 2017/7/28.
//  Copyright © 2017年 NNCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankModel : NSObject

@property (nonatomic,copy) NSString *bk_no;//银行卡号
@property (nonatomic,copy) NSString *bkname;//银行名称
@property (nonatomic,copy) NSString *bkbatch;//银行支行
@property (nonatomic,copy) NSString *cs;//城市
@property (nonatomic,copy) NSString *sf;//省份

- (void)clear;
@end


@interface MyInfoModel : NSObject

@property (nonatomic,copy) NSString *uname;//姓名
@property (nonatomic,copy) NSString *login;//账户名
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *wx;
@property (nonatomic,copy) NSString *cs;//城市
@property (nonatomic,copy) NSString *sf;//省份
@property (nonatomic,copy) NSString *mobile;
@property (nonatomic,strong) BankModel* UserCard;


@end
