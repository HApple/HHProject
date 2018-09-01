//
//  HHBaseEventDelegate.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "HHTableViewController.h"
#import "HHCollectionViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface HHBaseEventDelegate : NSObject{
    
}

@property (nonatomic, readonly, weak) UIViewController *viewController;

//指定初始化方法
- (instancetype)initWithViewController:(UIViewController *)viewController;
@end

@interface HHBaseEventDelegate (HHTableViewController){
    
}
@property (nonatomic, readonly, weak) HHTableViewController *hh_tableViewController;

- (void)hh_tableViewDidSelectCell:(NSIndexPath *)indexPath item:(__kindof NSObject * _Nullable)item;

@end

@interface HHBaseEventDelegate (HHCollectionViewController){
    
}
@property (nonatomic, readonly, weak) HHCollectionViewController *hh_collectionViewController;

- (void)hh_collectionViewDidSelectCell:(NSIndexPath *)indexPath item:(__kindof NSObject * _Nullable)item;

@end



NS_ASSUME_NONNULL_END
