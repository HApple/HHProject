//
//  HHTableExample.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableExample.h"
#import "HHTableExample+Configure.h"

@interface HHTableExample ()

@end

@implementation HHTableExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hh_pulldownRefresh:(HHTableView *)tableView {
    [self.mvvmViewModel hh_HTTPActionWithSuccess:nil failure:nil];
}


@end
