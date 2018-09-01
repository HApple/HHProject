//
//  HHRefreshControl.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/6.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "HHRefreshConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHRefreshControl : NSObject<HHRefreshConfiguration>{
    
}

@property (nonatomic, strong, readonly)UIScrollView *hh_scrollView;

//指定初始化方法
- (instancetype)initWithScrollView:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
