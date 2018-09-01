//
//  UICollectionViewCell+CollectionExampleCell.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "UICollectionViewCell+CollectionExampleCell.h"

@implementation UICollectionViewCell (CollectionExampleCell)

- (void)configureCellWithItem:(HHCollectionModel *)item {
}

+ (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath item:(HHCollectionModel *)item {
    return CGSizeZero;
}

@end
