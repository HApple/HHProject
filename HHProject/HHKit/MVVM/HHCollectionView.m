//
//  HHCollectionView.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionView.h"
#import "HHRefreshControl.h"

@interface HHCollectionView ()

@property (nonatomic, readwrite, strong)HHRefreshControl *hh_refreshControl;

@end

@implementation HHCollectionView

-(HHRefreshControl *)hh_refreshControl{
    if (_hh_refreshControl) {
        return _hh_refreshControl;
    }
    _hh_refreshControl = [[HHRefreshControl alloc] initWithScrollView:self];
    return _hh_refreshControl;
}

@end
