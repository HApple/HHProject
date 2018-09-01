//
//  HHTableViewController.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableViewController.h"
#import "HHKit.h"



static NSString *const UITableViewCellIdentifier = @"UITableViewCellIdentifier";


@interface HHTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong, readwrite)HHTableView *hh_tableView;
@property (nonatomic, strong, readwrite) NSMutableArray *hh_dataSource;
@property (nonatomic, strong, readwrite)HHRefreshControl *hh_refreshControl;

@end

@implementation HHTableViewController

#pragma mark -
#pragma mark - initWithStyle
- (instancetype)initWithStyle:(UITableViewStyle)style {
    
    
    if (self = [super init]) {
        [self setTableViewStyle:style];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self hh_tableViewRefreshConfig];
    
}

#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hh_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellIdentifier];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%zi",indexPath.row]];
    return cell;
}


#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark - Getter
- (HHTableView *)hh_tableView {
    
    HHGetMethodReturnObjc(_hh_tableView);
    
    CGRect tmpRect = (CGRect){.origin = CGPointZero, .size = {self.view.width, self.view.height}};
    _hh_tableView = [[HHTableView alloc] initWithFrame:tmpRect style:self.tableViewStyle];
    [_hh_tableView setDelegate:self];
    [_hh_tableView setDataSource:self];
    [_hh_tableView setShowsVerticalScrollIndicator:NO];
    [self hh__setupRefresh__];
    [self.view hh_removeSubViewsWithClass:[HHTableView class]];
    [self.view addSubview:_hh_tableView];
    return _hh_tableView;
}

- (NSMutableArray *)hh_dataSource {
    HHGetMethodReturnObjc(_hh_dataSource);
    _hh_dataSource = [[NSMutableArray alloc] init];
    return _hh_dataSource;
}

- (HHRefreshControl *)hh_refreshControl {
    return self.hh_tableView.hh_refreshControl;
}

#pragma mark -
#pragma mark - Setter



#pragma mark -
#pragma mark - setupRefresh
- (void)hh__setupRefresh__ {
    
    __weak __typeof(self) weakSelf = self;
    
    [self.hh_refreshControl setHh_headerRefreshing:^(UIScrollView * _Nonnull scrollView) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf hh_pulldownRefresh:strongSelf.hh_tableView];
    }];
    
    [self.hh_refreshControl setHh_footerRefreshing:^(UIScrollView * _Nonnull scrollView) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf hh_pullupLoad:strongSelf.hh_tableView];
    }];
}

@end



@implementation HHTableViewController (Refreshing)

- (void)hh_pulldownRefresh:(HHTableView *)tableView {
}

- (void)hh_pullupLoad:(HHTableView *)tableView {
}

- (void)hh_tableViewRefreshConfig {
    
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
