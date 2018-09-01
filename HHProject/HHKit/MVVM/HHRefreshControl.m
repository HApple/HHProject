//
//  HHRefreshControl.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHRefreshControl.h"
#import "HHKit.h"
#import <MJRefresh.h>

@interface HHRefreshControl () {
}

/*
 本地私有属性 (pl : private local)
 */

@property (nonatomic, readwrite, strong) UIScrollView *scrollView;

@property (nonatomic, copy) HHRefreshingBlock pl_headerRefreshing;
@property (nonatomic, copy) HHRefreshingBlock pl_footerRefreshing;
@end



@implementation HHRefreshControl
#pragma mark -
#pragma mark - initWithScrollView
- (instancetype)initWithScrollView:(UIScrollView *)scrollView {
    
    
    if (self = [super init]) {
        if (!scrollView) {
            [NSException exceptionWithName:[NSString stringWithFormat:@"%s",__func__] reason:@"scrollView must not be nil" userInfo:nil];
        }
        [self setScrollView:scrollView];
    }
    return self;
}

#pragma mark -
#pragma mark - HHRefreshConfiguration

#pragma mark - Property Setter

-(void)setHh_refreshHeaderClass:(Class)hh_refreshHeaderClass{
    __weak __typeof(self) weakSelf = self;
    HHRefreshHeader *refreshHeader = nil;
    if (hh_refreshHeaderClass && [hh_refreshHeaderClass isSubclassOfClass:[HHRefreshHeader class]]) {
        refreshHeader = [[hh_refreshHeaderClass alloc] init];
        [refreshHeader setRefreshingBlock:^{
            if (weakSelf.pl_headerRefreshing) {
                weakSelf.pl_headerRefreshing(self.scrollView);
            }
        }];
        
    } else {
    }
    [self.scrollView setMj_header:refreshHeader];
}

- (void)setHh_refreshFooterClass:(Class)hh_refreshFooterClass{
    
    __weak __typeof(self) weakSelf = self;
    HHRefreshFooter *refreshFooter = nil;
    if (hh_refreshFooterClass && [hh_refreshFooterClass isSubclassOfClass:[HHRefreshFooter class]]) {
        refreshFooter = [[hh_refreshFooterClass alloc] init];
        [refreshFooter setRefreshingBlock:^{
            if (weakSelf.pl_footerRefreshing) {
                weakSelf.pl_footerRefreshing(self.scrollView);
            }
        }];
        
    } else {
    }
    [self.scrollView setMj_footer:refreshFooter];
}

-(void)setHh_headerRefreshing:(HHRefreshingBlock)hh_headerRefreshing{
    if (self.pl_headerRefreshing != hh_headerRefreshing) {
        self.pl_headerRefreshing = hh_headerRefreshing;
    }
}

- (void)setHh_footerRefreshing:(HHRefreshingBlock)hh_footerRefreshing{
    if (self.pl_footerRefreshing != hh_footerRefreshing) {
        self.pl_footerRefreshing = hh_footerRefreshing;
    }
}



#pragma mark - Property Getter

- (Class)hh_refreshHeaderClass {
    return [self.scrollView.mj_header class];
}

- (Class)hh_refreshFooterClass {
    return [self.scrollView.mj_footer class];
}

- (HHRefreshingBlock)hh_headerRefreshing {
    return self.pl_headerRefreshing;
}

- (HHRefreshingBlock)hh_footerRefreshing {
    return self.pl_footerRefreshing;
}

#pragma mark - method

- (void)hh_pullupBeginLoad {
    [self.scrollView.mj_footer beginRefreshing];
}

- (void)hh_pullupEndLoad {
    [self.scrollView.mj_footer endRefreshing];
}

- (BOOL)hh_isPullupLoad {
    return [self.scrollView.mj_footer isRefreshing];
}

- (void)hh_pulldownBeginRefreshing {
    [self.scrollView.mj_header beginRefreshing];
}

- (void)hh_pulldownEndRefreshing {
    [self.scrollView.mj_header endRefreshing];
}

- (BOOL)hh_isPulldownRefresh {
    return [self.scrollView.mj_header isRefreshing];
}

- (void)hh_noticeNoMoreData {
    [self.scrollView.mj_footer endRefreshingWithNoMoreData];
}

- (void)hh_resetNoMoreData {
    [self.scrollView.mj_footer resetNoMoreData];
}

@end
