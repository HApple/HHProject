//
//  HHCollectionView.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHRefreshControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHCollectionView : UICollectionView

@property (nonatomic, readonly, strong)HHRefreshControl *hh_refreshControl;

@end

NS_ASSUME_NONNULL_END
