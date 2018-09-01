//
//  UIViewController+HHUtilities.m
//  HHProject
//
//  Created by huang on 2018/4/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "UIViewController+HHUtilities.h"

@implementation UIViewController (HHUtilities)

+ (UIViewController *)hh_topViewController{
    
    UIViewController *currentViewController = [HHAppDel.window rootViewController];
    
    while ([currentViewController presentedViewController]){
         currentViewController = [currentViewController presentedViewController];
    }
    
    if ([currentViewController isKindOfClass:[UINavigationController class]]){
        
        while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController]){
            
            currentViewController = [(UINavigationController*)currentViewController topViewController];
        }
        
        
    }else if([currentViewController isKindOfClass:[UITabBarController class]]){
        
        UITabBarController *tabbarController = (UITabBarController *)currentViewController;
        UIViewController *viewController = tabbarController.selectedViewController;
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            currentViewController = [(UINavigationController*)currentViewController topViewController];
        }else{
            currentViewController = viewController;
        }
    }
    
    return currentViewController;

}

@end
