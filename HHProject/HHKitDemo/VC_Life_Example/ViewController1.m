//
//  ViewController1.m
//  HHProject
//
//  Created by huang on 2018/4/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"


@interface ViewController1 ()

@end

@implementation ViewController1

- (void)loadView{
    [super loadView];
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 100, 40);
    [button addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"push" forState:UIControlStateNormal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}


- (void)nextAction{
    NSLog(@"push ViewController2");
    [self.navigationController pushViewController:ViewController2.new animated:YES];
}
@end
