//
//  HHViewController.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHViewController.h"

@interface HHViewController ()

@end

@implementation HHViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    @weakify(self);
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(self);
        [self hh_addSubviews];
        [self hh_bindViewModel];
    }];
    
    [[self rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        @strongify(self);
        [self hh_getNewData];
    }];
}

#pragma mark - RAC
/**
 *  添加控件
 */
- (void)hh_addSubviews {}

/**
 *  绑定
 */
- (void)hh_bindViewModel {}

/**
 *  初次获取数据
 */
- (void)hh_getNewData {}

@end
