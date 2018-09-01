//
//  HHCollectionFaceCell.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionFaceCell.h"
#import "HHKit.h"

#define kFaceImageViewSize  CGSizeMake([UIScreen hh_fitScreen:(150)], [UIScreen hh_fitScreen:(150)])
#define kContentMargin      [UIScreen hh_fitScreen:(30)]

@implementation HHCollectionFaceCell

- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - Getter
- (UIImageView *)faceImageView {
    HHGetMethodReturnObjc(_faceImageView);
    
    CGRect rect = CGRectMake(kContentMargin, kContentMargin, kFaceImageViewSize.width, kFaceImageViewSize.height);
    _faceImageView = [[UIImageView alloc] initWithFrame:rect];
    [_faceImageView.layer setCornerRadius:CGRectGetWidth(_faceImageView.bounds) / 2];
    [_faceImageView.layer setMasksToBounds:YES];
    [_faceImageView setTag:INT8_MAX];
    [[self.contentView viewWithTag:INT8_MAX] removeFromSuperview]
    ;
    [self.contentView addSubview:_faceImageView];
    return _faceImageView;
}

#pragma mark - Interface Method
- (void)configureCellWithItem:(HHCollectionModel *)item {
    
    [self.faceImageView sd_setImageWithURL:[NSURL URLWithString:item.faceURL]];

}

+ (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath item:(HHCollectionModel *)item {
    CGSize size = kFaceImageViewSize;
    size.width  += (kContentMargin * 2);
    size.height += (kContentMargin * 2);
    return size;
}



@end
