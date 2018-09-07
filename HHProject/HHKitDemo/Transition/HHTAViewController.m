//
//  HHTAViewController.m
//  HHProject
//
//  Created by huang on 2018/9/7.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHTAViewController.h"
#import "HHTransitionAnimation.h"

@interface HHTAViewController ()<UINavigationControllerDelegate>

@end

@implementation HHTAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    return nil;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return [[HHTransitionAnimation alloc] init];
    }
    
    return nil;
}


@end
