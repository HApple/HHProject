//
//  HHTableExampleCell.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/10.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTableExampleModel.h"

@interface HHTableExampleCell : UITableViewCell

NS_ASSUME_NONNULL_BEGIN
@property (null_resettable, nonatomic, strong) UIImageView *faceImageView;
@property (null_resettable, nonatomic, strong) UILabel *introLabel;

- (void)configureCellWithItem:(HHTableExampleModel *)item;
+ (CGFloat)cellHeightForItem:(HHTableExampleModel *)item;
@end
NS_ASSUME_NONNULL_END
