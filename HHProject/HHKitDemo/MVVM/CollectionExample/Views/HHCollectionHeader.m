//
//  HHCollectionHeader.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionHeader.h"
#import "HHKit.h"

#define kHeadeHeightDefault     (44)
#define kTextLabelFontSize      (20)
#define kElementInterval        (5)
#define kContentInsert          (UIEdgeInsetsMake(10, 9, 0, 0))
#define kImageViewSize          (CGSizeMake(20, 20))
#define kTextLabelSizeDefault   (CGSizeMake(100, 20))


@interface HHCollectionHeader () {
}
@property (nonatomic, readwrite, strong) UIImageView *imageView;
@property (nonatomic, readwrite, strong) UILabel *textLabel;
@end


@implementation HHCollectionHeader

- (UIImageView *)imageView {
    HHGetMethodReturnObjc(_imageView);
    CGRect rect = (CGRect){.size = kImageViewSize, .origin = {kContentInsert.left, kContentInsert.top}};
    _imageView = [[UIImageView alloc] initWithFrame:rect];
    [self hh_removeSubViewsWithClass:[_imageView class]];
    [self addSubview:_imageView];
    return _imageView;
}

- (UILabel *)textLabel {
    HHGetMethodReturnObjc(_textLabel);
    CGRect rect = CGRectMake(CGRectGetMaxX(self.imageView.frame) + kElementInterval,  kContentInsert.top, kTextLabelSizeDefault.width, kTextLabelSizeDefault.height);
    _textLabel = [[UILabel alloc] initWithFrame:rect];
  //  [_textLabel setFont:[UIFont hh_font:kTextLabelFontSize]];
    [_textLabel setTextColor:[UIColor blackColor]];
    [self hh_removeSubViewsWithClass:[_textLabel class]];
    [self addSubview:_textLabel];
    return _textLabel;
}

- (void)configureHeadeWithIndexPath:(NSIndexPath *)indexPath {
    [self.textLabel setText:[NSString stringWithFormat:@"section %c",(char)(indexPath.section + 65)]];
}

+ (CGSize)headeSizeForSection:(NSInteger)section {
    return CGSizeMake([UIScreen hh_width], kHeadeHeightDefault);
}
@end
