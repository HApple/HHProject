//
//  HHCollectionExample.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionExample.h"
#import "HHCollectionExample+Configure.h"

@interface HHCollectionExample ()

@end

@implementation HHCollectionExample

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    
//    [self.navigationController setNavigationBarHidden:NO];
//    self.extendedLayoutIncludesOpaqueBars = YES;
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureCollectionView];
   // [self.hh_collectionView.hh_refreshControl hh_pulldownBeginRefreshing];
}

#pragma mark -
#pragma mark - Refresh
- (void)hh_pulldownRefresh:(HHCollectionView *)collectionView{
    [self.mvvmViewModel hh_HTTPActionWithSuccess:nil failure:nil];
}

- (void)hh_pullupLoad:(HHCollectionView *)collectionView{
    [self.hh_refreshControl hh_pullupEndLoad];
}

@end
