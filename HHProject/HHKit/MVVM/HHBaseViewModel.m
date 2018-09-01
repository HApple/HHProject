//
//  HHBaseViewModel.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHBaseViewModel.h"
#import "HHTableViewController.h"
#import "HHCollectionViewController.h"

@interface HHBaseViewModel ()

@property (nonatomic, readwrite, weak) UIViewController *viewController;
@property (nonatomic, readwrite, weak) NSMutableArray *hh_dataSource;

@end

@implementation HHBaseViewModel

+ (instancetype)hh_modelWithViewController:(UIViewController *)viewController dataSource:(NSMutableArray *)dataSource{
    return [[[self class] alloc] initWithViewController:viewController dataSource:dataSource];
}

- (instancetype)initWithViewController:(UIViewController *)viewController dataSource:(NSMutableArray *)dataSource{
    
    if (self = [super init]) {
        [self setViewController:viewController];
        [self setHh_dataSource:dataSource];
    }
    return self;
}

#pragma mark - 
#pragma mark - Getter
- (NSMutableArray *)hh_dataSource{
    if (_hh_dataSource) {
        return _hh_dataSource;
    }
    _hh_dataSource = [NSMutableArray array];
    return _hh_dataSource;
}


#pragma mark -
#pragma mark - Delegate

- (NSInteger)hh_numberOfSections{
    return [self.hh_dataSource count] > 0 ? 1 : 0;
}

- (NSInteger)hh_numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(NSInteger)hh_numberOfItemsInSection:(NSInteger)section{
    return 0;
}

-(id)hh_itemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.hh_dataSource.count) {
        return self.hh_dataSource[indexPath.row];
    }
    return nil;
}

-(id)hh_itemAtRow:(NSInteger)row{
    if (row < self.hh_dataSource.count) {
        return self.hh_dataSource[row];
    }
    return nil;
}

#pragma mark -
#pragma mark - http action

- (void)hh_HTTPActionWithSuccess:(nullable void(^)())success failure:(nullable void(^)())failure{
    
}

- (void)hh_HTTPNextPageWithSuccess:(nullable void(^)())success failure:(nullable void(^)())failure{
    
}
@end


@implementation HHBaseViewModel (AspTableViewController)

- (HHTableViewController *)hh_tableViewController {
    if ([self.viewController isKindOfClass:[HHTableViewController class]]) {
        return (HHTableViewController *)self.viewController;
    }
    return nil;
}


@end

@implementation HHBaseViewModel (HHCollectionViewController)

- (HHCollectionViewController *)hh_collectionViewController {
    if ([self.viewController isKindOfClass:[HHCollectionViewController class]]) {
        return (HHCollectionViewController *)self.viewController;
    }
    return nil;
}

@end
