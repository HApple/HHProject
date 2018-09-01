//
//  NSString+HHCheck.m
//  HHProject
//
//  Created by huang on 2018/4/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "NSString+HHCheck.h"

@implementation NSString (HHCheck)

#pragma mark - 判断是否是手机号码
- (BOOL) isPhone{
    NSString *regex = @"\\b(1)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [phoneTest evaluateWithObject:self];
}


#pragma mark - 判断是否是email地址
- (BOOL) isEmail{
    NSString*regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTest evaluateWithObject:self];
}


#pragma mark - 判断是否是QQ
- (BOOL) isQQ{
    NSString *regex = @"\\d{5,10}";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [qqTest evaluateWithObject:self];
}


#pragma mark - 判断是否是正确的验证码
- (BOOL) isAuthCode{
    NSString *regex = @"\\d{6}";
    NSPredicate *authCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [authCodeTest evaluateWithObject:self];
}

#pragma mark - 是否是汉字
- (BOOL) isHanzi
{
    NSString *regex = @"^[\u4e00-\u9fa5]";
    NSPredicate *authCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [authCodeTest evaluateWithObject:self];
}

#pragma mark - 身份证号
- (BOOL) isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:self];
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(self.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}

#pragma mark - 判断银行卡号是否合法
- (BOOL)isBankCard{
    if(self.length == 0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++){
        c = [self characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}
@end
