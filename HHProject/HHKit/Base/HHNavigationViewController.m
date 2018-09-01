//
//  HHNavigationViewController.m
//  HHProject
//
//  Created by huang on 2018/8/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHNavigationViewController.h"
#import "UIViewController+LeftBarButtonItem.h"

@interface HHNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation HHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
}



- (void)onBackButtonTapped:(id)sender
{
    [self popViewControllerAnimated:YES];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        [viewController setLeftBarButtonItem];
    }
    [super pushViewController:viewController animated:animated];
}


@end
