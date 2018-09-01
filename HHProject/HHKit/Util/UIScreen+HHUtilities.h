//
//  UIScreen+HHUtilities.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (HHUtilities)

//屏幕适配，IPhone以750X1334为基准，750是宽，1334是高
//        IPad以2048X1536为基准，2048是宽，1536是高
+ (CGFloat)hh_fitScreen:(CGFloat)size;

+ (CGFloat)hh_width;
+ (CGFloat)hh_height;

+ (CGFloat)hh_topBarHeight;
@end
