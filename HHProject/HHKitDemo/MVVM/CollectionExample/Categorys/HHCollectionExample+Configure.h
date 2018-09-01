//
//  HHCollectionExample+Configure.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionExample.h"
#import "HHCollectionEventDelegate.h"
#import "HHCollectionViewModel.h"
#import "HHCollectionDelegate.h"


@interface HHCollectionExample (Configure)

@property (nonatomic, strong, readonly) HHCollectionEventDelegate *mvvmEventDelegate;
@property (nonatomic, strong, readonly) HHCollectionViewModel *mvvmViewModel;
@property (nonatomic, strong, readonly) HHCollectionDelegate *mvvmDelegate;

- (void)configureCollectionView;

@end
