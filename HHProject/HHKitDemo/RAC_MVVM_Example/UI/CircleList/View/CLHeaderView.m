//
//  CLHeaderView.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLHeaderView.h"
#import "CLHeaderViewModel.h"
#import "CLCollectionViewCell.h"


@interface CLHeaderView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) CLHeaderViewModel *viewModel;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation CLHeaderView

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel{
    
    self.viewModel = viewModel;
    return [super initWithViewModel:viewModel];
    
}

- (void)hh_setupViews {
    
    [self addSubview:self.bgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
    
    [self setupConstraints];
    

}

- (void)setupConstraints {
    
    CGFloat paddingEdge = 10;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(self);
        make.bottom.equalTo(-paddingEdge);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(paddingEdge);
        make.top.equalTo(paddingEdge);
        make.right.equalTo(paddingEdge);
        make.height.equalTo(20);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-paddingEdge);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(paddingEdge);
    }];

}


- (void)hh_bindViewModel{
    
    @weakify(self);
    
    [[self.viewModel.refreshUISubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
       
        @strongify(self);
        [self.collectionView reloadData];

    }];
    
    
    RAC(self.titleLabel, text) = [[RACObserve(self, viewModel.title) distinctUntilChanged] takeUntil:self.rac_willDeallocSignal];
    
}


#pragma mark - lazyLoad
- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    
    return _bgView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    return _titleLabel;
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.collectionViewLayout = self.flowLayout;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[CLCollectionViewCell class] forCellWithReuseIdentifier:@"CLCollectionViewCell"];
        
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    
    if (!_flowLayout) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.minimumLineSpacing = 10;
    }
    
    return _flowLayout;
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.viewModel.dataArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CLCollectionViewCell" forIndexPath:indexPath];
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    
    if (self.viewModel.dataArray.count == indexPath.row) {
        
        cell.type = @"加入新圈子";
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(80, 105);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewModel.cellClickSubject sendNext:nil];
}

@end
