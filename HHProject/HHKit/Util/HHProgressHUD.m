//
//  HHProgressHUD.m
//  HHProject
//
//  Created by huang on 2018/4/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHProgressHUD.h"
#import <MBProgressHUD.h>
#import "UIViewController+HHUtilities.h"
#import "UIColor+HHHex.h"

@implementation HHProgressHUD

#pragma mark - show Text
+ (void)showMessage:(NSString *)message{
    
    NSTimeInterval time = [self calculateTextShowTime:message];
    [self showMessage:message afterDelay:time];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)time{
    [self showMessage:message afterDelay:time onView:HHAppDel.window];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)time onView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:time];
}

+ (NSTimeInterval)calculateTextShowTime:(NSString *)text{
    
    NSTimeInterval time = text.length / 5 + text.length%5/5;
    time = MAX(1.0, time);
    return time;
}

#pragma mark - show UIActivityIndicatorView
+ (void)showLoading{
    [self showLoadingOnView:[UIViewController hh_topViewController].view];
}

+ (void)hideLoading{
    [self hideLoadingOnView:[UIViewController hh_topViewController].view];
}

+ (void)showLoadingOnView:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud showAnimated:YES];
}

+ (void)hideLoadingOnView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view  animated:YES];
}

@end
