//
//  HHCollectionViewController.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionViewController.h"
#import <MJRefresh.h>
#import "HHKit.h"

static NSString *const UICollectionViewCellIdentifier = @"UICollectionViewCellIdentifier";

@interface HHCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, readwrite, strong) UICollectionViewLayout *hh_collectionViewLayout;
@property (nonatomic, readwrite, strong) NSMutableArray *hh_dataSource;
@property (nonatomic, readwrite, strong) HHRefreshControl *hh_refreshControl;
@property (nonatomic, readwrite, strong) HHCollectionView *hh_collectionView;


@end

@implementation HHCollectionViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super init]) {
        [self setHh_collectionViewLayout:layout];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self hh_collectionViewRefreshConfig];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hh_dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICollectionViewCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - 
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 
#pragma mark - Getter

- (HHCollectionView *)hh_collectionView{
    
    HHGetMethodReturnObjc(_hh_collectionView);
    
    _hh_collectionView = [[HHCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.hh_collectionViewLayout];
    [_hh_collectionView setBackgroundColor:[UIColor whiteColor]];
    [self hh_registerReusableCells];
    [self hh_registerSupplementaryViews];
    if ([self hh_shouldRefresh]) {
        [self hh__setupRefresh__];
    }
    [_hh_collectionView setDelegate:self];
    [_hh_collectionView setDataSource:self];
    [self.view hh_removeSubViewsWithClass:[_hh_collectionView class]];
    [self.view addSubview:_hh_collectionView];
    return _hh_collectionView;
    
}


- (NSMutableArray *)hh_dataSource {
    HHGetMethodReturnObjc(_hh_dataSource);
    _hh_dataSource = [NSMutableArray array];
    return _hh_dataSource;
}

- (HHRefreshControl *)hh_refreshControl {
    return (HHRefreshControl *)self.hh_collectionView.hh_refreshControl;
}

#pragma mark -
#pragma mark - Interface Method
- (void)hh_registerReusableCells {
    //     Rewrite this method in SubClass !
}

- (void)hh_registerSupplementaryViews {
    //     Rewrite this method in SubClass !
}

#pragma mark -
#pragma mark - Private Method

- (void)hh__setupRefresh__ {
    
    __weak __typeof(self) weakSelf = self;
    
    [self.hh_refreshControl setHh_headerRefreshing:^(UIScrollView * _Nonnull scrollView) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf hh_pulldownRefresh:strongSelf.hh_collectionView];
    }];

    [self.hh_refreshControl setHh_footerRefreshing:^(UIScrollView * _Nonnull scrollView) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf hh_pullupLoad:strongSelf.hh_collectionView];
    }];
    
}
@end

@implementation HHCollectionViewController (Refreshing)

- (void)hh_pulldownRefresh:(HHCollectionView *)collectionView {
}

- (void)hh_pullupLoad:(HHCollectionView *)collectionView {
}

- (void)hh_collectionViewRefreshConfig {
    
    Class headerClass = Nil;
    Class footerClass = Nil;
    
    if ([self hh_shouldRefresh]) {
        headerClass = [HHRefreshHeader class];
        footerClass = [HHRefreshFooter class];
    }
    
    if (!self.hh_refreshControl.hh_refreshHeaderClass) self.hh_refreshControl.hh_refreshHeaderClass = headerClass;
    if (!self.hh_refreshControl.hh_refreshFooterClass) self.hh_refreshControl.hh_refreshFooterClass = footerClass;
    
}

- (BOOL)hh_shouldRefresh {
    return YES;
}

@end
