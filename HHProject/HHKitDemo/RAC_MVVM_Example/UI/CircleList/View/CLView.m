//
//  CLView.m
//  HHProject
//
//  Created by huang on 2018/6/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLView.h"
#import "CLViewModel.h"
#import "CLHeaderView.h"
#import "CLSectionHeaderView.h"
#import "CLTableViewCell.h"

@interface CLView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) CLViewModel *viewModel;

@property (nonatomic,strong) UITableView *mainTableView;

@property (nonatomic,strong) CLHeaderView *listHeaderView;

@property (nonatomic,strong) CLSectionHeaderView *sectionHeaderView;

@end


@implementation CLView

#pragma mark - system

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel{
    self.viewModel = (CLViewModel *)viewModel;
    return  [super initWithViewModel:viewModel];
}

#pragma mark - private
- (void)hh_setupViews{
    [self addSubview:self.mainTableView];
    
    [self setupConstraints];
    
}

- (void)setupConstraints{
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [super updateConstraints];
}

- (void)hh_bindViewModel{
    
    [self.viewModel.refreshDataCommand execute:nil];
    
    @weakify(self);
    
    [self.viewModel.refreshUI subscribeNext:^(id x) {
        @strongify(self);
        [self.mainTableView reloadData];
    }];
    
    [self.viewModel.refreshEndSubject subscribeNext:^(id x) {
        @strongify(self);
        [self.mainTableView reloadData];
        
        switch ([x integerValue]) {
            case HHHeaderRefresh_HasMoreData:
            {
                [self.mainTableView.mj_header endRefreshing];
                
                if (self.mainTableView.mj_footer == nil) {
                    self.mainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                        @strongify(self);
                        [self.viewModel.nextPageCommand execute:nil];
                    }];
                }
            }
                break;
            case HHHeaderRefresh_HasNoMoreData:
            {
                [self.mainTableView.mj_header endRefreshing];
                self.mainTableView.mj_footer = nil;
            }
                break;
            case HHFooterRefresh_HasMoreData:
            {
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer resetNoMoreData];
                [self.mainTableView.mj_footer endRefreshing];
            }
                break;
            case HHFooterRefresh_HasNoMoreData:
            {
                [self.mainTableView.mj_header endRefreshing];
                [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
            case HHRefreshError:{
                [self.mainTableView.mj_footer endRefreshing];
                [self.mainTableView.mj_header endRefreshing];
            }
                break;
            default:
                break;
        }
        
        
    }];
    
}


#pragma mark - lazyLoad
- (CLViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[CLViewModel alloc] init];
    }
    
    return _viewModel;
}

- (UITableView *)mainTableView {
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = self.listHeaderView;
        [_mainTableView registerClass:[CLTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([CLTableViewCell class])]];
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [self.viewModel.refreshDataCommand execute:nil];
        }];
        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [self.viewModel.nextPageCommand execute:nil];
        }];
    }
    
    return _mainTableView;
}

- (CLHeaderView *)listHeaderView {
    
    if (!_listHeaderView) {
        
        _listHeaderView = [[CLHeaderView alloc] initWithViewModel:self.viewModel.listHeaderViewModel];
        _listHeaderView.frame = CGRectMake(0, 0, kScreenWidth, 160);
    }
    
    return _listHeaderView;
}

- (CLSectionHeaderView *)sectionHeaderView {
    
    if (!_sectionHeaderView) {
        
        _sectionHeaderView = [[CLSectionHeaderView alloc] initWithViewModel:self.viewModel.sectionHeaderViewModel];
    }
    
    return _sectionHeaderView;
}

#pragma mark - delegate

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([CLTableViewCell class])] forIndexPath:indexPath];
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewModel.cellClickSubject sendNext:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 45;
}
@end
