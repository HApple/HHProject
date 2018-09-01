//
//  UICollectionViewCell+CollectionExampleCell.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHCollectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (CollectionExampleCell)

- (void)configureCellWithItem:(HHCollectionModel *)item;

+ (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath item:(nullable HHCollectionModel *)item;

@end
NS_ASSUME_NONNULL_END
