//
//  UIViewController+LeftBarButtonItem.m
//  SmileIntl
//
//  Created by huang on 2018/4/17.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "UIViewController+LeftBarButtonItem.h"

@implementation UIViewController (LeftBarButtonItem)

- (void)setLeftBarButtonItem{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    backView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backAction)];
    [backView addGestureRecognizer:tap];
    
    CGFloat width = 17/1.5;
    CGFloat height = 28/1.5;
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, (backView.height-height)/2, width, height)];
    backImage.image = [UIImage imageNamed:@"nav_back"];
    [backView addSubview:backImage];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backView];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
