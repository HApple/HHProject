//
//  UIScrollView+HHRefreshControl.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "UIScrollView+HHRefreshControl.h"
#import <objc/runtime.h>

@implementation UIScrollView (HHRefreshControl)
@dynamic hh_refreshControl;

#pragma mark - 
#pragma mark - refreshControl
- (void)setHh_refreshControl:(HHRefreshControl *)hh_refreshControl{
    
    [self willChangeValueForKey:NSStringFromSelector(@selector(hh_refreshControl))];
    objc_setAssociatedObject(self, @selector(hh_refreshControl), hh_refreshControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:NSStringFromSelector(@selector(hh_refreshControl))];
}

- (HHRefreshControl *)hh_refreshControl{
    return objc_getAssociatedObject(self, _cmd);
}

@end
