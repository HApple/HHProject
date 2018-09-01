//
//  CLSectionHeaderView.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLSectionHeaderView.h"
#import "CLSectionHeaderViewModel.h"

@interface CLSectionHeaderView()

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *lineImageView;

@property (nonatomic, strong) CLSectionHeaderViewModel *viewModel;

@end


@implementation CLSectionHeaderView

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel {
    
    self.viewModel = (CLSectionHeaderViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)hh_setupViews {
    
    [self addSubview:self.bgImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineImageView];
    [self setupConstraints];
    
}

- (void)setupConstraints {
    
    CGFloat paddingEdge = 10;
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.left.equalTo(paddingEdge);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(20);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(1.0);
    }];
    
}

- (void)hh_bindViewModel {
    
    RAC(self.titleLabel, text) = [[RACObserve(self, viewModel.title) distinctUntilChanged] takeUntil:self.rac_willDeallocSignal];
}

#pragma mark - lazyLoad
- (UIImageView *)bgImageView {
    
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    
    return _bgImageView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = [UIColor blackColor];
    }
    
    return _titleLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _lineImageView;
}


@end
