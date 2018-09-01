//
//  NSString+HHCheck.h
//  HHProject
//
//  Created by huang on 2018/4/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "CommonCrypto/CommonDigest.h"

@interface NSString (HHCheck)

/**
 判断是否是手机号码
 */
- (BOOL) isPhone;

/**
 判断是否是email地址
 */
- (BOOL) isEmail;

/**
 判断是否是QQ
 */
- (BOOL) isQQ;

/**
 判断是否是正确的6位数验证码
 */
- (BOOL) isAuthCode;

/**
 判断是否是汉字
 */
- (BOOL) isHanzi;

/**
 判断是否是身份证号
 */
- (BOOL)isValidateIdentityCard;

/**
 判断银行卡号是否合法
 */
- (BOOL)isBankCard;
@end
