//
//  HHTableViewController.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTableView.h"
#import "HHTableViewDelegate.h"
#import "HHRefreshControl.h"


NS_ASSUME_NONNULL_BEGIN

@interface HHTableViewController : UIViewController {
}
@property (nonatomic, strong, readonly)HHTableView *hh_tableView;
@property (nonatomic, strong, readonly) NSMutableArray *hh_dataSource;
@property (nonatomic, strong, readonly)HHRefreshControl *hh_refreshControl;

- (instancetype)initWithStyle:(UITableViewStyle)style;
@end


@interface HHTableViewController (Refreshing)
//配置首尾视图
//只需要给[HHRefreshControl]属性的[hh_refreshHeaderClass]与[hh_refreshFooterClass]赋值即可, 如果子类不重写，将使用默认的首尾视图
- (void)hh_tableViewRefreshConfig;

//上拉加载时调用的方法 将会调用[AspRefreshControl]的Block属性[hh_headerRefreshing]子类重载
- (void)hh_pullupLoad:(HHTableView *)tableView;

//下拉刷新时调用的方法 将会调用[HHRefreshControl]的Block属性[hh_footerRefreshing]子类重载
- (void)hh_pulldownRefresh:(HHTableView *)tableView;

//如果不想要[HHRefreshControl]工作, 可以重写这个方法并返回 'NO'
- (BOOL)hh_shouldRefresh;

@end


NS_ASSUME_NONNULL_END
