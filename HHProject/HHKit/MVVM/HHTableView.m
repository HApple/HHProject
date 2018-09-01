//
//  HHTableView.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableView.h"
#import "UIScrollView+HHRefreshControl.h"

@interface HHTableView ()

//@property (nonatomic, readwrite, strong)HHRefreshControl *hh_refreshControl;

@end


@implementation HHTableView

-(HHRefreshControl *)hh_refreshControl{
    
    HHRefreshControl *refreshControl = [super hh_refreshControl];
    if (refreshControl) return refreshControl;
    
    refreshControl = [[HHRefreshControl alloc] initWithScrollView:self];
    [super setHh_refreshControl:refreshControl];
    return refreshControl;

}

@end
