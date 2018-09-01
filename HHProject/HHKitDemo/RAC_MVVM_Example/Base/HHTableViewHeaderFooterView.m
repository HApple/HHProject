//
//  HHTableViewHeaderFooterView.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHTableViewHeaderFooterView.h"

@implementation HHTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self hh_setupViews];
    }
    return self;
}

- (void)hh_setupViews {}

@end
