//
//  HHTableViewDelegate.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHBaseViewModel.h"


@class HHTableViewController;

NS_ASSUME_NONNULL_BEGIN

//返回每个cell的高度(默认44)
typedef CGFloat (^HHTableViewCellHeightBlock)(NSIndexPath *indexPath, id item);

//配置cell
typedef void (^HHTableViewCellConfigureBlock)(NSIndexPath *indexPath, id item, __kindof UITableViewCell *cell);

//选中UITableViewCell的Block
typedef void (^HHTableViewDidSelectCellBlock)(NSIndexPath *indexPath, id item);


@interface HHTableViewDelegate : NSObject  <UITableViewDataSource, UITableViewDelegate>{

}
@property (null_resettable, nonatomic, copy) HHTableViewCellHeightBlock hh_cellHeightBlock;
@property (nullable, nonatomic, copy) HHTableViewCellConfigureBlock hh_cellConfigureBlock;
@property (nullable, nonatomic, copy) HHTableViewDidSelectCellBlock hh_didSelectCellBlock;
@property (nonatomic, readonly, weak) UITableView *hh_tableView;
@property (nonatomic, readonly, strong) HHBaseViewModel *hh_viewModel;

//指定初始化方法 cellIdentifier 必须与cell的类名相同  暂不支持XIB
- (instancetype)initWithTableView:(UITableView *)tableView
                   cellIdentifier:(NSString *)cellIdentifier
                        viewModel:(HHBaseViewModel *)viewModel;

//cell将会在此方法中创建  如果有多个 cell 建议继承一个子类重写这个方法 或者直接重写代理
- (UITableViewCell *)hh_tableViewCellWithTableView:(UITableView *)tableView
                                 forRowAtIndexPath:(NSIndexPath *)indexPath;

//根据索引返回item
- (id)hh_itemAtIndexPath:(NSIndexPath *)indexPath;
- (id)hh_itemAtRow:(NSInteger)row;
@end



@interface HHTableViewDelegate (HHTableViewController) {
}
@property (nonatomic, readonly, weak) HHTableViewController *hh_tableViewController;

@end

NS_ASSUME_NONNULL_END
