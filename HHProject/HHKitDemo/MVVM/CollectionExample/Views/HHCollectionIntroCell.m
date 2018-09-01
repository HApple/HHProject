//
//  HHCollectionIntroCell.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionIntroCell.h"
#import "HHKit.h"
#import <UIImageView+WebCache.h>

#define kFaceImageSizeDefault        CGSizeMake([UIScreen hh_fitScreen:(200)], [UIScreen hh_fitScreen:(200)])
#define kContentMargin               [UIScreen hh_fitScreen:(30)]

@implementation HHCollectionIntroCell

- (UIImageView *)faceImageView {
    HHGetMethodReturnObjc(_faceImageView);
    CGRect rect = (CGRect){.size = kFaceImageSizeDefault, .origin = {kContentMargin, kContentMargin}};
    _faceImageView = [[UIImageView alloc] initWithFrame:rect];
    [_faceImageView.layer setCornerRadius:CGRectGetWidth(_faceImageView.bounds) / 2];
    [_faceImageView.layer setMasksToBounds:YES];
    [self.contentView hh_removeSubViewsWithClass:[_faceImageView class]];
    [self.contentView addSubview:_faceImageView];
    return _faceImageView;
}

- (UILabel *)introLabel {
    HHGetMethodReturnObjc(_introLabel);
    CGFloat minX = CGRectGetMaxX(self.faceImageView.frame) + 10;
    CGFloat minY = CGRectGetMinY(self.faceImageView.frame);
    CGFloat width = [UIScreen hh_width]  * 0.6;
    _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(minX, minY, width, 0)];
    [_introLabel setNumberOfLines:3];
    [_introLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [_introLabel setTag:INT8_MAX + 1];
    [self.contentView hh_removeSubViewsWithClass:[_introLabel class]];
    [self.contentView addSubview:_introLabel];
    return _introLabel;
}

- (void)configureCellWithItem:(HHCollectionModel *)item {
    
    [self.faceImageView sd_setImageWithURL:[NSURL URLWithString:item.faceURL]];
    
    [self.introLabel setText:item.intro];
    [self.introLabel sizeToFit];
}

+ (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath item:(HHCollectionModel *)item {
    CGSize size = kFaceImageSizeDefault;
    size.width = [UIScreen hh_width];
    size.height += (kContentMargin * 2);
    return size;
}


@end
