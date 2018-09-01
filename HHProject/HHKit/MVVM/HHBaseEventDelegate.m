//
//  HHBaseEventDelegate.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHBaseEventDelegate.h"
#import "HHTableViewController.h"
#import "HHCollectionViewController.h"

@interface HHBaseEventDelegate ()

@property (nonatomic, readwrite, weak) UIViewController *viewController;

@end

@implementation HHBaseEventDelegate

- (instancetype)initWithViewController:(UIViewController *)viewController{
    
    if (self = [super init]) {
        [self setViewController:viewController];
    }
    return self;
}

@end

@implementation HHBaseEventDelegate (HHTableViewController)

-(HHTableViewController *)hh_tableViewController{
    if ([self.viewController isKindOfClass:[HHTableViewController class]]) {
        return (HHTableViewController *)self.viewController;
    }
    return nil;
}

- (void)hh_tableViewDidSelectCell:(NSIndexPath *)indexPath item:(__kindof NSObject *)item{
    
}
@end

@implementation HHBaseEventDelegate (HHCollectionViewController)

- (HHCollectionViewController *)hh_collectionViewController{
    if ([self.viewController isKindOfClass:[HHCollectionViewController class]]) {
        return (HHCollectionViewController *)self.viewController;
    }
    return nil;
}

- (void)hh_collectionViewDidSelectCell:(NSIndexPath *)indexPath item:(__kindof NSObject *)item{
    
}
@end
