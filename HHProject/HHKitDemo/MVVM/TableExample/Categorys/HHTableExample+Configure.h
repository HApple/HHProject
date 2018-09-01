//
//  HHTableExample+Configure.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableExample.h"
#import "HHTableEventDelegate.h"
#import "HHTableDelegate.h"
#import "HHTableViewModel.h"



@interface HHTableExample (Configure)

@property (nonatomic, strong)HHTableEventDelegate *mvvmEventDelegate;
@property (nonatomic, strong)HHTableDelegate *mvvmDelegate;
@property (nonatomic, strong)HHTableViewModel *mvvmViewModel;

- (void)configureTableView;

@end
