//
//  HHCollectionViewCell.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHCollectionViewCell.h"

@implementation HHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self hh_setupViews];
    }
    return self;
}

- (void)hh_setupViews {}

@end

