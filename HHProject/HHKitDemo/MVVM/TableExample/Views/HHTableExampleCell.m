//
//  HHTableExampleCell.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/10.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableExampleCell.h"
#import "HHKit.h"
#import <UIImageView+WebCache.h>

#define kCellDefaultHeight  [UIScreen hh_fitScreen:(260)]
#define kContentMargin      [UIScreen hh_fitScreen:(30)]


@implementation HHTableExampleCell
- (void)prepareForReuse {
    [super prepareForReuse];
}

- (UIImageView *)faceImageView {
    HHGetMethodReturnObjc(_faceImageView);
    
    CGFloat x = kContentMargin;
    CGFloat y = kContentMargin;
    CGFloat w = [UIScreen hh_fitScreen:200];
    CGFloat h = [UIScreen hh_fitScreen:200];
    _faceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [_faceImageView.layer setCornerRadius:CGRectGetWidth(_faceImageView.bounds) / 2];
    [_faceImageView.layer setMasksToBounds:YES];
    [_faceImageView setTag:INT8_MAX];
    [[self.contentView viewWithTag:INT8_MAX] removeFromSuperview];
    [self.contentView addSubview:_faceImageView];
    return _faceImageView;
}

- (UILabel *)introLabel {
    HHGetMethodReturnObjc(_introLabel);
    CGFloat minX = CGRectGetMaxX(self.faceImageView.frame) + 10;
    CGFloat minY = CGRectGetMinY(self.faceImageView.frame);
    CGFloat width = [UIScreen hh_width]  * 0.6;
    _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(minX, minY, width, 0)];
    [_introLabel setNumberOfLines:0];
    [_introLabel setTag:INT8_MAX + 1];
    [[self.contentView viewWithTag:INT8_MAX + 1] removeFromSuperview];
    [self.contentView addSubview:_introLabel];
    return _introLabel;
}


- (void)configureCellWithItem:(HHTableExampleModel *)item {
  
    [self.faceImageView sd_setImageWithURL:[NSURL URLWithString:item.faceURL]];
    [self.introLabel setAttributedText:[[self class] attributedStringWithString:item.intro]];
    [self.introLabel sizeToFit];
}

+ (CGFloat)cellHeightForItem:(HHTableExampleModel *)item {
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen hh_width]  * 0.6;
    CGFloat h = 0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [label setNumberOfLines:0];
    [label setAttributedText:[[self class] attributedStringWithString:item.intro]];
    [label sizeToFit];
    
    CGFloat height = label.bounds.size.height + (kContentMargin * 2);
    if (height > kCellDefaultHeight) {
        return height;
    }
    return kCellDefaultHeight;
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string {
    NSRange range = [string rangeOfString:@"Taylor Swift"];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor redColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:16]};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:attributes range:range];
    return attributedString;
}
@end
