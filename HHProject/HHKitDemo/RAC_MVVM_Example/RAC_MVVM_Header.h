//
//  RAC_MVVM_Header.h
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,HHRefreshDataStatus) {
    HHHeaderRefresh_HasMoreData = 1,
    HHHeaderRefresh_HasNoMoreData,
    HHFooterRefresh_HasMoreData,
    HHFooterRefresh_HasNoMoreData,
    HHRefreshError,
    HHRefreshUI
};

//-----------------------------------------------HHViewControllerProtocol----------------------------------------------------------
@protocol HHViewModelProtocol;

@protocol HHViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id <HHViewModelProtocol>)viewModel;

- (void)hh_bindViewModel;
- (void)hh_addSubviews;
- (void)hh_getNewData;

@end


//-----------------------------------------------HHViewProtocol----------------------------------------------------------
@protocol HHViewModelProtocol;

@protocol HHViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel;

- (void)hh_bindViewModel;
- (void)hh_setupViews;

@end


//-----------------------------------------------HHViewModelProtocol----------------------------------------------------------

@protocol HHViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;

/**
 * 初始化
 */
- (void)hh_initialize;

@end
