//
//  HHView.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHView.h"

@implementation HHView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    [self hh_setupViews];
    [self hh_bindViewModel];
}

- (void)hh_setupViews {}

- (void)hh_bindViewModel {}


@end
