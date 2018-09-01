//
//  CLTableViewCell.h
//  HHProject
//
//  Created by huang on 2018/6/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHTableViewCell.h"
#import "CLCollectionCellViewModel.h"

@interface CLTableViewCell : HHTableViewCell

@property (nonatomic, strong) CLCollectionCellViewModel *viewModel;

@end
