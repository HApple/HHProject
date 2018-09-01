//
//  HHCollectionDelegate.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionDelegate.h"
#import "HHKit.h"
#import "HHCollectionFaceCell.h"
#import "HHCollectiontTextCell.h"
#import "HHCollectionIntroCell.h"
#import "HHCollectionHeader.h"
#import "HHCollectionModel.h"

static NSString *const HHCollectionFaceCellIdentifier       = @"HHCollectionFaceCell";
static NSString *const HHCollectiontTextCellIdentifier       = @"HHCollectiontTextCell";
static NSString *const HHCollectionIntroCellIdentifier      = @"HHCollectionIntroCell";
static NSString *const HHCollectionHeaderIdentifier         = @"HHCollectionHeader";

#define kSectionInset  UIEdgeInsetsMake(0, [UIScreen hh_fitScreen:(20)], [UIScreen hh_fitScreen:(50)], [UIScreen hh_fitScreen:(20)])


@implementation HHCollectionDelegate

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                  collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
                        cellIdentifier:(NSString *)cellIdentifier
                             viewModel:(HHBaseViewModel *)viewModel {
    
    if (self = [super initWithCollectionView:collectionView
                        collectionViewLayout:collectionViewLayout
                              cellIdentifier:cellIdentifier
                                   viewModel:viewModel]) {
      //  [self configureCollectionView];
        [self configureItemSize];
        [self configureSectionInset];
    }
    return self;
}


#pragma mark -
#pragma mark - register cells
- (void)hh_registerReusableCells {
    
    [self.hh_collectionView registerClass:NSClassFromString(HHCollectionFaceCellIdentifier)
            forCellWithReuseIdentifier:HHCollectionFaceCellIdentifier];
    [self.hh_collectionView registerClass:NSClassFromString(HHCollectiontTextCellIdentifier)
            forCellWithReuseIdentifier:HHCollectiontTextCellIdentifier];
    [self.hh_collectionView registerClass:NSClassFromString(HHCollectionIntroCellIdentifier)
            forCellWithReuseIdentifier:HHCollectionIntroCellIdentifier];
}


- (void)hh_registerSupplementaryViews {
    [self.hh_collectionView registerClass:NSClassFromString(HHCollectionHeaderIdentifier)
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:HHCollectionHeaderIdentifier];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return [HHCollectionHeader headeSizeForSection:section];
}


- (UICollectionViewCell *)hh_collectionCellWithCollectionView:(UICollectionView *)collectionView
                                            forRowAtIndexPath:(NSIndexPath *)indexPath{
    HHLog(@"indexpath section%ld . row%ld",(long)indexPath.section,(long)indexPath.row);
    HHCollectionModel *item = [self hh_itemAtIndexPath:indexPath];
    NSString *identifier = nil;
    switch (indexPath.section) {
        case CollectionExampleItemTypeFace: {
            identifier = HHCollectionFaceCellIdentifier;
            break;
        }
        case CollectionExampleItemTypeText: {
            identifier = HHCollectiontTextCellIdentifier;
            break;
        }
        case CollectionExampleItemTypeIntro: {
            identifier = HHCollectionIntroCellIdentifier;
            break;
        }
        default: break;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell configureCellWithItem:item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HHCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HHCollectionHeaderIdentifier forIndexPath:indexPath];
        [header configureHeadeWithIndexPath:indexPath];
        return header;
    }
    return nil;
}


#pragma mark -
#pragma mark - configure
- (void)configureSectionInset {
    [self setHh_sectionInset:^UIEdgeInsets(NSInteger section){
        UIEdgeInsets edgeInsets = kSectionInset;
        switch (section) {
            case CollectionExampleItemTypeFace:
                break;
            case CollectionExampleItemTypeText: {
                edgeInsets = kSectionInset;
                break;
            }
            case CollectionExampleItemTypeIntro: {
                edgeInsets = UIEdgeInsetsZero;;
                break;
            }
            default: break;
        }
        return edgeInsets;

    }];

}

- (void)configureItemSize {
    
    [self setHh_itemSize:^CGSize(NSIndexPath *indexPath) {
        
        CGSize size = CGSizeZero;
        switch (indexPath.section) {
            case CollectionExampleItemTypeFace: {
                size = [HHCollectionFaceCell itemSizeForIndexPath:indexPath item:nil];
                break;
            }
            case CollectionExampleItemTypeText: {
                size = [HHCollectiontTextCell itemSizeForIndexPath:indexPath item:nil];
                break;
            }
            case CollectionExampleItemTypeIntro: {
                size = [HHCollectionIntroCell itemSizeForIndexPath:indexPath item:nil];
                break;
            }
            default: break;
        }
        return size;
    }];

}

- (void)configureCollectionView {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen hh_width];
    CGFloat h = [UIScreen hh_height] - [UIScreen hh_topBarHeight];
    [self.hh_collectionView setFrame:CGRectMake(x, y, w, h)];
}


@end
