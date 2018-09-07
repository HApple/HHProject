//
//  HHTransitionAnimation.m
//  HHProject
//
//  Created by huang on 2018/9/7.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHTransitionAnimation.h"

@implementation HHTransitionAnimation

#pragma mark - UIViewControllerInteractiveTransitioning
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 2.0f;
    
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
 
//    UIViewController *toViewContorller = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:toView];
//
//
//
    
    
}
@end
