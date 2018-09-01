//
//  UILabel+HHUtilities.h
//  NNtongbao
//
//  Created by huang on 2018/3/15.
//  Copyright © 2018年 NNCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HHUtilities)


//Attribute
- (void)setAttributeStr:(NSString *)changeStr Color:(UIColor *)color font:(UIFont *)font;
- (void)setTextWithLinkAttribute:(NSString *)text Color:(UIColor *)color font:(UIFont *)font;
- (void)setUnderLine;

//Calculate width/height
- (CGFloat)labelWidthWidthHeight:(CGFloat)height;
- (CGFloat)labelWidthWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size;
- (CGFloat)labelHeightWithWidth:(CGFloat)width;
- (CGFloat)labelHeightWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size;



@end
