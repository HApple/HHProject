//
//  HHCollectionViewController.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHCollectionView.h"
#import "HHRefreshControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHCollectionViewController : UIViewController {
}
@property (nonatomic, readonly, strong) HHCollectionView *hh_collectionView;
@property (nonatomic, readonly, strong) NSMutableArray *hh_dataSource;
@property (nonatomic, readonly, strong) HHRefreshControl *hh_refreshControl;
@property (nonatomic, readonly, strong) UICollectionViewLayout *hh_collectionViewLayout;

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;
- (void)hh_registerReusableCells;       //Rewrite this method in SubClass
- (void)hh_registerSupplementaryViews;  //Rewrite this method in SubClass
@end


@interface HHCollectionViewController (Refreshing)
//配置首尾视图
//只需要给[HHRefreshControl]属性的[hh_refreshHeaderClass]与[hh_refreshFooterClass]赋值即可,如果子类不重写，将使用默认的首尾视图
- (void)hh_collectionViewRefreshConfig;

//上拉加载时调用的方法，将会调用[HHRefreshControl]的Block属性[hh_footerRefreshing]子类重载
- (void)hh_pullupLoad:(HHCollectionView *)collectionView;

//下拉刷新时调用方法,将会调用方法[HHRefreshControl]的Block属性的[hh_headerRefreshing]子类重载
- (void)hh_pulldownRefresh:(HHCollectionView *)collectionView;

//如果不想要 refreshControl 工作 可以重写这个方法并返回 'NO'
- (BOOL)hh_shouldRefresh;
@end

NS_ASSUME_NONNULL_END
