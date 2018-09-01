//
//  CLCollectionViewCell.h
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHCollectionViewCell.h"
#import "CLCollectionCellViewModel.h"

@interface CLCollectionViewCell : HHCollectionViewCell

@property (nonatomic,strong) CLCollectionCellViewModel *viewModel;

/**
 *  加入新圈子
 */
@property (nonatomic, strong) NSString *type;

@end
