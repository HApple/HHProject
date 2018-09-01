//
//  UILabel+HHUtilities.m
//  NNtongbao
//
//  Created by huang on 2018/3/15.
//  Copyright © 2018年 NNCai. All rights reserved.
//

#import "UILabel+HHUtilities.h"

@implementation UILabel (HHUtilities)


- (void)setAttributeStr:(NSString *)changeStr Color:(UIColor *)color font:(UIFont *)font
{
    NSArray * rangeArr = [self selectRange:self.text ChangeStr:changeStr];
    
    NSMutableAttributedString * noteStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    for (NSString * rangeStr in rangeArr) {
        NSRange range = NSRangeFromString(rangeStr);
        if (color) {
            [noteStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        if (font) {
            [noteStr addAttribute:NSFontAttributeName value:font range:range];
        }
        
    }
    [self setAttributedText:noteStr];
}

- (NSArray *)selectRange:(NSString *)mainStr ChangeStr:(NSString *)changeStr
{
    NSMutableArray * rangeArr = [[NSMutableArray alloc] init];
    for (NSInteger num = 0; ; num ++) {
        NSRange range = [mainStr rangeOfString:changeStr];
        if (range.location != NSNotFound) {
            mainStr = [mainStr substringFromIndex:range.location + range.length];
            NSString * lastStr = [rangeArr lastObject];
            if (lastStr != nil) {
                NSRange lastRange = NSRangeFromString(lastStr);
                range.location = range.location + lastRange.location + lastRange.length;
            }
            [rangeArr addObject:NSStringFromRange(range)];
        }else
        {
            break;
        }
    }
    
    return rangeArr;
}


#pragma mark - underline
- (void)setUnderLine{
    
    NSMutableAttributedString * noteStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [noteStr addAttribute:NSUnderlineColorAttributeName value:self.textColor range:NSMakeRange(0, self.text.length)];
    [noteStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, self.text.length)];
    self.attributedText = noteStr;
    
}

#pragma mark - link Url
- (void)setTextWithLinkAttribute:(NSString *)text Color:(UIColor *)color font:(UIFont *)font{
    self.attributedText = [self subStr:text Color:color font:font];
}

-(NSMutableAttributedString*)subStr:(NSString *)string Color:(UIColor *)color font:(UIFont *)font{
    
    NSError *error;
    //可以识别url的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                  
                                                                           options:NSRegularExpressionCaseInsensitive
                                  
                                                                             error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSMutableArray *rangeArr=[[NSMutableArray alloc]init];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        
        NSString* substringForMatch;
        substringForMatch = [string substringWithRange:match.range];
        [arr addObject:substringForMatch];
    }
    
    NSString *subStr=string;
    for (NSString *str in arr) {
        [rangeArr addObject:[self rangesOfString:str inString:subStr]];
    }

    NSMutableAttributedString *attributedText;
    attributedText=[[NSMutableAttributedString alloc] initWithString:subStr attributes:@{NSFontAttributeName :font}];

    for(NSValue *value in rangeArr){
        
       // NSInteger index=[rangeArr indexOfObject:value];
        NSRange range=[value rangeValue];
       // [attributedText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:[arr objectAtIndex:index]] range:range];
        [attributedText addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributedText;
}

//获取查找字符串在母串中的NSRange
- (NSValue *)rangesOfString:(NSString *)searchString inString:(NSString *)str {
    NSRange searchRange = NSMakeRange(0, [str length]);
    NSRange range;
    if ((range = [str rangeOfString:searchString options:0 range:searchRange]).location != NSNotFound) {
        searchRange = NSMakeRange(NSMaxRange(range), [str length] - NSMaxRange(range));
    }
    return [NSValue valueWithRange:range];
}

#pragma mark - width / height
- (CGFloat)labelWidthWidthHeight:(CGFloat)height{
    return [self labelWidthWithText:self.text font:self.font size:CGSizeMake([UIScreen mainScreen].bounds.size.width, height)];
}

- (CGFloat)labelWidthWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size{
    CGRect bounds = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName ,nil] context:nil];
    return bounds.size.width;
}

- (CGFloat)labelHeightWithWidth:(CGFloat)width{
    return [self labelHeightWithText:self.text font:self.font size:CGSizeMake(width, MAXFLOAT)];
}

- (CGFloat)labelHeightWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size{
    CGRect bounds = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName ,nil] context:nil];
    return bounds.size.height;
}

@end
