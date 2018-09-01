//
//  HHProgressHUD.h
//  HHProject
//
//  Created by huang on 2018/4/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHProgressHUD : NSObject

/**
 默认显示在视图层级结构的顶层ViewController的View上 参考[UIViewController hh_topViewController]
 默认根据文字长短自动计算显示时间 如5个字显示一秒 10个字显示两秒
 */
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)time;
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)time onView:(UIView *)view;

/**
 根据文字计算显示时间
 */
+ (NSTimeInterval)calculateTextShowTime:(NSString *)text;


/**
 默认显示在视图层级结构的顶层ViewController的View上 参考[UIViewController hh_topViewController]
 */
+ (void)showLoading;
+ (void)showLoadingOnView:(UIView *)view;

+ (void)hideLoading;
+ (void)hideLoadingOnView:(UIView *)view;
@end
