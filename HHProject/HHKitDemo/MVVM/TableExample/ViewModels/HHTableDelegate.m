//
//  HHTableDelegate.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableDelegate.h"
#import "HHTableExampleModel.h"
#import "HHTableExampleCell.h"


@implementation HHTableDelegate

- (instancetype)initWithTableView:(UITableView *)tableView
                   cellIdentifier:(NSString *)cellIdentifier
                        viewModel:(HHBaseViewModel *)viewModel {
    self = [super initWithTableView:tableView cellIdentifier:cellIdentifier viewModel:viewModel];
    if (self) {
        
        [self configureCell];
        [self configureCellHeight];
    }
    return self;
}


#pragma mark -
#pragma mark - configure

- (void)configureCell {
    
    [self setHh_cellConfigureBlock:^(NSIndexPath *indexPath, id item, __kindof UITableViewCell *cell){
       
        [cell configureCellWithItem:item];
    }];

}

- (void)configureCellHeight {
    [self setHh_cellHeightBlock:^CGFloat(NSIndexPath *indexPath, HHTableExampleModel *item) {
        return [HHTableExampleCell cellHeightForItem:item];
    }];
}
@end
