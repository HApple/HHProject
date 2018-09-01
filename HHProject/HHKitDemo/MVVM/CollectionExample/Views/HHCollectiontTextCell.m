//
//  HHCollectiontTextCell.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectiontTextCell.h"
#import "HHKit.h"

@implementation HHCollectiontTextCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.layer setBorderWidth:1.0f];
    [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
}

#pragma mark - Getter
- (UILabel *)textLabel {
    HHGetMethodReturnObjc(_textLabel);
    _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [_textLabel setTextAlignment:NSTextAlignmentCenter];
    [self hh_removeSubViewsWithClass:[_textLabel class]];
    [self.contentView addSubview:_textLabel];
    return _textLabel;
}

- (void)configureCellWithItem:(HHCollectionModel *)item {
    [self.textLabel setText:@"Taylor"];
}

+ (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath item:(HHCollectionModel *)item {
    return CGSizeMake([UIScreen hh_fitScreen:(150)], [UIScreen hh_fitScreen:(40)]);
}
@end
