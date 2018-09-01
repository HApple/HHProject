//
//  HHTableViewDelegate.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableViewDelegate.h"
#import "HHKit.h"

#define HHTableViewSectionsDefault     (1)
#define HHTableViewCellHeightDefault   (44.0f)

@interface HHTableViewDelegate ()

@property (nonatomic, readwrite, weak) UITableView *hh_tableView;
@property (nonatomic, readwrite, strong) HHBaseViewModel *hh_viewModel;
@property (nonatomic, copy) NSString *hh_cellIdentifier;

@end

@implementation HHTableViewDelegate

#pragma mark -
#pragma mark - init 
- (instancetype)initWithTableView:(UITableView *)tableView
                   cellIdentifier:(NSString *)cellIdentifier
                        viewModel:(HHBaseViewModel *)viewModel{
    if (self = [super init]) {
        [self setHh_tableView:tableView];
        [self setHh_cellIdentifier:cellIdentifier];
        [self setHh_viewModel:viewModel];
    }
    return self;
}

#pragma mark -
#pragma mark - Getter

-(HHTableViewCellHeightBlock)hh_cellHeightBlock{
    HHGetMethodReturnObjc(_hh_cellHeightBlock);
    _hh_cellHeightBlock = ^CGFloat(NSIndexPath *indexPath, id item){ return HHTableViewCellHeightDefault;};
    return _hh_cellHeightBlock;
}


#pragma mark -
#pragma mark - Setter

- (void)setHh_tableView:(UITableView *)hh_tableView {
    if (_hh_tableView != hh_tableView) {
        _hh_tableView = nil;
        _hh_tableView = hh_tableView;
        [_hh_tableView setDataSource:self];
        [_hh_tableView setDelegate:self];
    }
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.hh_viewModel hh_numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.hh_viewModel hh_numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self hh_tableViewCellWithTableView:tableView forRowAtIndexPath:indexPath];
    if (self.hh_cellConfigureBlock) {
        self.hh_cellConfigureBlock(indexPath, [self hh_itemAtIndexPath:indexPath], cell);
    }
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.hh_didSelectCellBlock) {
        self.hh_didSelectCellBlock(indexPath, [self hh_itemAtIndexPath:indexPath]);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.hh_cellHeightBlock(indexPath, [self hh_itemAtIndexPath:indexPath]);
}
#pragma mark -
#pragma mark - Interface Method


- (UITableViewCell *)hh_tableViewCellWithTableView:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.hh_cellIdentifier];
    if (!cell) {
        Class cellClass = NSClassFromString(self.hh_cellIdentifier);
        if (!cellClass) {
            [NSException exceptionWithName:@"error" reason:@" 'cellIdentifier' and 'cellClassName' HAS TO BE SAME " userInfo:nil];
        }
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.hh_cellIdentifier];
    }
    
    return cell;
}

- (id)hh_itemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.hh_viewModel hh_itemAtIndexPath:indexPath];
}

- (id)hh_itemAtRow:(NSInteger)row{
    return [self.hh_viewModel hh_itemAtRow:row];
}

@end
