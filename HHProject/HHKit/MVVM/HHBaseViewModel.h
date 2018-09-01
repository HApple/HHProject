//
//  HHBaseViewModel.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#


@class HHTableViewController;
@class HHCollectionViewController;

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseViewModel : NSObject{
}
@property (nonatomic, readonly, weak) UIViewController *viewController;
@property (nonatomic, readonly, weak) NSMutableArray *hh_dataSource;

//配置ViewController
+ (instancetype)hh_modelWithViewController:(UIViewController *)viewController
                                dataSource:(NSMutableArray *)dataSource;
//指定初始化方法
- (instancetype)initWithViewController:(UIViewController *)viewController
                            dataSource:(NSMutableArray *)dataSource;

//共有多少组 默认为1
- (NSInteger)hh_numberOfSections;
//每组中显示多少行(UITableView)
- (NSInteger)hh_numberOfRowsInSection:(NSInteger)section;
//每组中显示多少个(UICollectionView)
- (NSInteger)hh_numberOfItemsInSection:(NSInteger)section;

//根据索引返回item
- (nullable id)hh_itemAtIndexPath:(NSIndexPath *)indexPath;
- (nullable id)hh_itemAtRow:(NSInteger)row;  //无分组情况


//分离控制器网络请求 子类实现类似功能的方法 (不建议在控制器中处理数据，为了防止你不小心这么做，旧的API已经废弃)
//success  预留，不建议使用，设为 'nil' 即可
//failure  预留，不建议使用，设为 'nil' 即可
- (void)hh_HTTPActionWithSuccess:(nullable void(^)())success failure:(nullable void(^)())failure;
- (void)hh_HTTPNextPageWithSuccess:(nullable void(^)())success failure:(nullable void(^)())failure;

@end

@interface HHBaseViewModel (HHTableViewController){
}

@property (nonatomic ,readonly, weak) HHTableViewController *hh_tableViewController;

@end

@interface HHBaseViewModel (HHCollectionViewController){
}
@property (nonatomic, readonly, weak) HHCollectionViewController *hh_collectionViewController;
@end


NS_ASSUME_NONNULL_END
