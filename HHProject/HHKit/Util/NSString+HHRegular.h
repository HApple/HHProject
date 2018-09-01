//
//  NSString+HHRegular.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/5.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (HHRegular)

//当前字符串是否为纯数字
- (BOOL)hh_isNumber;

//当前字符是否为 number位的数字
//quantity 限制数字的数量
- (BOOL)hh_checkMoreNumber:(NSInteger)quantity;

//当前字符是否为 至少number位的数字
//quantity 至少数字的数量
- (BOOL)hh_checkAtLeastNumber:(NSInteger)quantity;

//当前字符是否为 汉字
- (BOOL)hh_isChineseCharacter;

//当前字符是否为 由数字和26个英文字母组成的字符串
- (BOOL)hh_isEnglishAndNumbers;

//当前字符是否为 长度为3-20的所有字符
//fistRange 开始的范围
//lastRange 结束的范围
- (BOOL)hh_limitinglength:(NSInteger)fistRange lastRange:(NSInteger)lastRange;

//当前字符长度是否位length, 并且是由字母和数字所组成
//length 字符的长度
//string 字符的内容
- (BOOL)hh_checkString:(NSInteger)length;

//当前字符是否为 由26个英文字母组成的字符串
- (BOOL)hh_isLettersString;

//当前字符是否为 由26个大写英文字母组成的字符串
- (BOOL)hh_isCapitalLetters;

//当前字符是否为 由26个小写英文字母组成的字符串
- (BOOL)hh_isLowercaseLetters;

//当前字符是否为 由数字、26个英文字母或者下划线组成的字符串
- (BOOL)hh_isNumbersAndLettersOrUnderlineString;

//当前字符是否为 中文、英文、数字包括下划线
- (BOOL)hh_isChineseCharacterAndEnglishAndNumbersAndUnderlineString;

//当前字符是否为 中文、英文、数字但不包括下划线等符号
- (BOOL)hh_isDoesNotContainUnderscoresChineseCharacterAndEnglishAndNumbersString;

//当前字符是否可以输入 含有^%&',;=?$\"等字符
- (BOOL)hh_isContainSpecialCharacterString;

//当前字符是否禁止输入 含有charater的字符
// charater  输入限制的字符
- (BOOL)hh_isContainCharacter:(NSString *)charater;

//当前字符是否为 Email地址
- (BOOL)hh_checkEmailAddress;

//当前字符是否为 域名
- (BOOL)hh_checkDomainName;

//当前字符是否为网址(InternetURL)
- (BOOL)hh_checkURL;

//当前字符是否为 手机号码
- (BOOL)hh_checkPhoneNumber;

//当前字符是否为 身份证号(15位、18位数字)
- (BOOL)hh_checkIdentityCard;

//当前字符是否为 短身份证号码(数字、字母x结尾)
- (BOOL)hh_checkShortIdentityCard;

//当前字符是否为合法帐号名(字母开头，允许5-16字节，允许字母数字下划线)
- (BOOL)hh_checkAccount;

//当前字符是否为 密码(以字母开头，长度在6~18之间, 并且密码是从0开始，只能包含字母、数字和下划线)
- (BOOL)hh_checkPassword;

//当前字符是否为 强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：,
//briefest指的是最短密码长度
//longest指的时最长密码长度
- (BOOL)hh_checkStrongPassword:(NSInteger)briefest longest:(NSInteger)longest;

//当前字符是否为 xml文件
- (BOOL)hh_checkXMLFile;

//当前字符串是否为中文字符
- (BOOL)hh_checkChineseCharacter;

//当前字符是否为 中国邮政编码：(中国邮政编码为6位数字)
- (BOOL)hh_checkPostalCode;

//当前字符是否为IPv4地址
- (BOOL)hh_checkIPv4InternetProtocol;

//是否为 Emoji表情字符
- (BOOL)hh_checkEmojiString;

/**
 Whether it can match the regular expression
 
 @param regex  The regular expression
 @param options     The matching options to report.
 @return YES if can match the regex; otherwise, NO.
 */
- (BOOL)hh_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

/**
 Match the regular expression, and executes a given block using each object in the matches.
 
 @param regex    The regular expression
 @param options  The matching options to report.
 @param block    The block to apply to elements in the array of matches.
 The block takes four arguments:
 match: The match substring.
 matchRange: The matching options.
 stop: A reference to a Boolean value. The block can set the value
 to YES to stop further processing of the array. The stop
 argument is an out-only argument. You should only ever set
 this Boolean to YES within the Block.
 */
- (void)hh_enumerateRegexMatches:(NSString *)regex
                          options:(NSRegularExpressionOptions)options
                       usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;

/**
 Returns a new string containing matching regular expressions replaced with the template string.
 
 @param regex       The regular expression
 @param options     The matching options to report.
 @param replacement The substitution template used when replacing matching instances.
 
 @return A string with matching regular expressions replaced by the template string.
 */
- (NSString *)hh_stringByReplacingRegex:(NSString *)regex
                                 options:(NSRegularExpressionOptions)options
                              withString:(NSString *)replacement;

@end

NS_ASSUME_NONNULL_END
