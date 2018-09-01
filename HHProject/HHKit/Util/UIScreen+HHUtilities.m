//
//  UIScreen+HHUtilities.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "UIScreen+HHUtilities.h"

@implementation UIScreen (HHUtilities)

+ (CGFloat)hh_fitScreen:(CGFloat)size{

    return  (ceilf( [UIScreen mainScreen].bounds.size.width / 375.0f  * (size / 2) * 2)/ 2.0f);
}

+ (CGFloat)hh_width{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)hh_height{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGFloat)hh_topBarHeight{
    return 64.0f;
}

@end
