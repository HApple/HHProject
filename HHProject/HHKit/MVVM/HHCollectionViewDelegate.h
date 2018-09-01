//
//  HHCollectionViewDelegate.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

//返回每个cell的高度 默认44
typedef CGFloat (^HHCollectionViewCellHeightBlock)(NSIndexPath *indexPath, id item);

//返回UICollectionViewCell的大小
typedef CGSize (^HHCollectionViewCellItemSize)(NSIndexPath *indexPath);

//返回UICollectionView每个Section中item的间隔Margin的Blcok
typedef UIEdgeInsets (^HHCollectionViewSectionInset)(NSInteger section);

//配置UICollectionViewCell的内容Block
typedef void (^HHCollectionViewCellConfigureBlock)(NSIndexPath *indexPath,id item, __kindof UICollectionViewCell *cell);

//选中UICollectionViewCell的Block
typedef void(^HHCollectionViewDidSelectCellBlock)(NSIndexPath *indexPath,id item);


@interface HHCollectionViewDelegate : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>{
}
@property (null_resettable, nonatomic, copy) HHCollectionViewCellItemSize hh_itemSize;//default is CGSizeMake(50,50)
@property (null_resettable, nonatomic, copy) HHCollectionViewSectionInset hh_sectionInset;
@property (nullable, nonatomic, copy) HHCollectionViewCellConfigureBlock hh_cellConfigureBlock;
@property (nullable, nonatomic, copy) HHCollectionViewDidSelectCellBlock hh_didSelectCellBlcok;

@property (nonatomic, readonly, weak) UICollectionView *hh_collectionView;
@property (nonatomic, readonly, weak) UICollectionViewLayout *hh_collectionViewLayout;
@property (nonatomic, readonly, strong) HHBaseViewModel *hh_viewModel;


//指定初始化方法 cellIdentifier 必须与cell的类名相同  暂不支持XIB(可以重写registerReusableCells)
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                  collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
                        cellIdentifier:(NSString *)cellIdentifier
                             viewModel:(HHBaseViewModel *)viewModel;

//cell将会在此方法中创建 如果有多个 cell 建议继承一个子类重写这个方法 或者 直接重写代理
- (UICollectionViewCell *)hh_collectionCellWithCollectionView:(UICollectionView *)collectionView
                                            forRowAtIndexPath:(NSIndexPath *)indexPath;

//注册cells class 如果需要 子类重写
- (void)hh_registerReusableCells;

//注册 section header and footer 子类重写
- (void)hh_registerSupplementaryViews;

//根据索引返回数据源item
- (id)hh_itemAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
