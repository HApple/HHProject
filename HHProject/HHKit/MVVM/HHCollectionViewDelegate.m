//
//  HHCollectionViewDelegate.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionViewDelegate.h"
#import "HHKit.h"

#define HHCollectionViewItemSizeDefault        CGSizeMake(50, 50)
#define HHCollectionViewSectionInsetDefault    UIEdgeInsetsZero


@interface HHCollectionViewDelegate ()

@property (nonatomic, readwrite, weak) UICollectionView *hh_collectionView;
@property (nonatomic, readwrite, weak) UICollectionViewLayout *hh_collectionViewLayout;
@property (nonatomic, readwrite, strong) HHBaseViewModel *hh_viewModel;

@property (nonatomic, copy) NSString *cellIdentifier;

@end

@implementation HHCollectionViewDelegate

#pragma mark - 
#pragma mark - init 
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                  collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
                        cellIdentifier:(NSString *)cellIdentifier
                             viewModel:(HHBaseViewModel *)viewModel{
    
    if (self = [super init]) {
        [self setHh_collectionView:collectionView];
        [self setHh_collectionViewLayout:collectionViewLayout];
        [self setCellIdentifier:_cellIdentifier];
        [self setHh_viewModel:viewModel];
    }
    
    return self;
}

#pragma mark - 
#pragma mark - Getter

- (HHCollectionViewCellItemSize)hh_itemSize{
    HHGetMethodReturnObjc(_hh_itemSize);
    _hh_itemSize = ^CGSize (NSIndexPath *indexPath) {
        
        return HHCollectionViewItemSizeDefault;
    };
    return _hh_itemSize;
}

- (HHCollectionViewSectionInset)hh_sectionInset {
    HHGetMethodReturnObjc(_hh_sectionInset);
    _hh_sectionInset = ^UIEdgeInsets(NSInteger section){return HHCollectionViewSectionInsetDefault;};
    return _hh_sectionInset;
}

#pragma mark - 
#pragma mark - Setter

- (void)setHh_collectionView:(UICollectionView *)hh_collectionView {
    if (_hh_collectionView != hh_collectionView) {
        _hh_collectionView = hh_collectionView;
        [_hh_collectionView setDataSource:self];
        [_hh_collectionView setDelegate:self];
        [_hh_collectionView setBackgroundColor:[UIColor whiteColor]];
        [self hh_registerReusableCells];
        [self hh_registerSupplementaryViews];
    }
}

#pragma mark -
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.hh_itemSize(indexPath);
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.hh_sectionInset(section);
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.hh_viewModel hh_numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.hh_viewModel hh_numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self hh_collectionCellWithCollectionView:collectionView forRowAtIndexPath:indexPath];
    if (self.hh_cellConfigureBlock) self.hh_cellConfigureBlock(indexPath, [self hh_itemAtIndexPath:indexPath], cell);
    return cell;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.hh_didSelectCellBlcok) self.hh_didSelectCellBlcok(indexPath, [self hh_itemAtIndexPath:indexPath]);
}

#pragma mark -
#pragma mark - Interface Method

- (UICollectionViewCell *)hh_collectionCellWithCollectionView:(UICollectionView *)collectionView forRowAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    if (self.hh_cellConfigureBlock) self.hh_cellConfigureBlock(indexPath, [self hh_itemAtIndexPath:indexPath], cell);
    return cell;
}

- (void)hh_registerReusableCells {
    Class cellClass = NSClassFromString(self.cellIdentifier);
    if (!cellClass) {
     
        [NSException exceptionWithName:@"error" reason:@" 'cellIdentifier' and 'cellClassName' HAS TO BE SAME " userInfo:nil];
        
    }
    [self.hh_collectionView registerClass:cellClass forCellWithReuseIdentifier:self.cellIdentifier];
    
    //     Rewrite this method in SubClass if necessary!
}

- (void)hh_registerSupplementaryViews {
    //     Rewrite this method in SubClass !
}

- (id)hh_itemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.hh_viewModel hh_itemAtIndexPath:indexPath];
}


@end
