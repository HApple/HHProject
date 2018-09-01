//
//  HHRefreshConfiguration.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <objc/objc.h>
#include <objc/runtime.h>


NS_ASSUME_NONNULL_BEGIN

typedef void (^HHRefreshingBlock)(__kindof UIScrollView *scrollView);

@protocol HHRefreshConfiguration <NSObject>
//自定义刷新的头部视图类, 必须是HHRefreshHeader的子类
@property (nullable, nonatomic) Class hh_refreshHeaderClass;

//自定义刷新的尾部视图类，必须是HHRefreshFooter的子类
@property (nullable, nonatomic) Class hh_refreshFooterClass;

//头部的回调
@property (nullable, nonatomic, copy) HHRefreshingBlock hh_headerRefreshing;

//尾部的回调
@property (nullable, nonatomic, copy) HHRefreshingBlock hh_footerRefreshing;

//开始上拉加载
- (void)hh_pullupBeginLoad;

//结束上拉加载
- (void)hh_pullupEndLoad;

//是否正在上拉加载
- (BOOL)hh_isPullupLoad;

//开始下拉刷新
- (void)hh_pulldownBeginRefreshing;

//结束下拉刷新
- (void)hh_pulldownEndRefreshing;

//是否正在下拉刷新
- (BOOL)hh_isPulldownRefresh;

//提示已经没有更多数据
- (void)hh_noticeNoMoreData;

//重置没有更多的数据 (消除没有更多数据的状态)
- (void)hh_resetNoMoreData;

@end



NS_ASSUME_NONNULL_END
