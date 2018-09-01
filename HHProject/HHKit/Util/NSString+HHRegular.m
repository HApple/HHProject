//
//  NSString+HHRegular.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/5.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "NSString+HHRegular.h"

@implementation NSString (HHRegular)

- (BOOL)hh_isNumber {
    NSString *rules              = @"^[0-9]*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkMoreNumber:(NSInteger)quantity {
    
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld}$", (long)quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkAtLeastNumber:(NSInteger)quantity {
 
    NSString *rules              = [NSString stringWithFormat:@"^\\d{%ld,}$", (long)quantity];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
    
}

- (BOOL)hh_isChineseCharacter {
    
    NSString *rules              = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
    
}


- (BOOL)hh_isEnglishAndNumbers {
    
    NSString *rules              = @"^[A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_limitinglength:(NSInteger)fistRange lastRange:(NSInteger)lastRange {
    
    NSString *rules              = [NSString stringWithFormat:@"^.{%ld,%ld}$", (long)fistRange, (long)lastRange];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkString:(NSInteger)length {
    NSString *rules              = @"^[A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    if (self.length == length) {
        if ([stringPredicate evaluateWithObject:self]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)hh_isLettersString {
    NSString *rules              = @"^[A-Za-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isCapitalLetters {
    
    NSString *rules              = @"^[A-Z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isLowercaseLetters {
    NSString *rules              = @"^[a-z]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isNumbersAndLettersOrUnderlineString {
    NSString *rules              = @"^\\w+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isChineseCharacterAndEnglishAndNumbersAndUnderlineString {
    
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString{
    
    NSString *rules              = @"^[\u4E00-\u9FA5A-Za-z0-9]+$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_isContainSpecialCharacterString {
    NSString *rules              = @"[^%&',;=?$\x22]+";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_isContainCharacter:(NSString *)charater{
    
    NSString *rules              = [NSString stringWithFormat:@"[^%@\x22]+", charater];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkEmailAddress {
    NSString *rules              = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkDomainName {
    
    NSString *rules              = @"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkURL {
    
    NSString *rules = @"^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,4})(\\:[0-9]+)?(/[^/][a-zA-Z0-9\\.\\,\\?\'\\/\\+&amp;%\\$#\\=~_\\-@]*)*$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkPhoneNumber {
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs    = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self] ||
    [regextestphs evaluateWithObject:self]    ||
    [regextestct evaluateWithObject:self]     ||
    [regextestcu evaluateWithObject:self]     ||
    [regextestcm evaluateWithObject:self];

}


- (BOOL)hh_checkIdentityCard {
    NSString *rules              = @"^\\d{15}|\\d{18}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkShortIdentityCard{
    NSString *rules              = @"^([0-9]){7,18}(x|X)?$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkAccount {
    NSString *rules              = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkPassword {
    
    NSString *rules              = @"^[a-zA-Z]\\w{5,17}$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkStrongPassword:(NSInteger)briefest longest:(NSInteger)longest{
    
    NSString *rules              = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{%ld,%ld}$", (long)briefest, (long)longest];
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

//当前字符是否为 xml文件
- (BOOL)hh_checkXMLFile {
    NSString *rules              = @"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

//当前字符串是否为中文字符
- (BOOL)hh_checkChineseCharacter {
    NSString *rules              = @"[\u4e00-\u9fa5]";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}

- (BOOL)hh_checkPostalCode {
    NSString *rules              = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkIPv4InternetProtocol {
    NSString *rules              = @"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))";
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rules];
    
    return [stringPredicate evaluateWithObject:self];
}


- (BOOL)hh_checkEmojiString {
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              const unichar hs = [substring characterAtIndex:0];
                              if (0xd800 <= hs && hs <= 0xdbff) {
                                  if (substring.length > 1) {
                                      const unichar ls = [substring characterAtIndex:1];
                                      const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                      if (0x1d000 <= uc && uc <= 0x1f77f) {
                                          returnValue = YES;
                                      }
                                  }
                              } else if (substring.length > 1) {
                                  const unichar ls = [substring characterAtIndex:1];
                                  if (ls == 0x20e3) {
                                      returnValue = YES;
                                  }
                              } else {
                                  if (0x2100 <= hs && hs <= 0x27ff) {
                                      returnValue = YES;
                                  } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                      returnValue = YES;
                                  } else if (0x2934 <= hs && hs <= 0x2935) {
                                      returnValue = YES;
                                  } else if (0x3297 <= hs && hs <= 0x3299) {
                                      returnValue = YES;
                                  } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                      returnValue = YES;
                                  }
                              }
                          }];
    
    return returnValue;
}

- (BOOL)hh_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0);
}

- (void)hh_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block {
    if (regex.length == 0 || !block) return;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!regex) return;
    [pattern enumerateMatchesInString:self options:kNilOptions range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        block([self substringWithRange:result.range], result.range, stop);
    }];
}

- (NSString *)hh_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!pattern) return self;
    return [pattern stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:replacement];
}


@end
