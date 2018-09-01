//
//  HHCollectionHeader.h
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface HHCollectionHeader : UICollectionReusableView

@property (null_resettable, nonatomic, readonly, strong) UIImageView *imageView;
@property (null_resettable, nonatomic, readonly, strong) UILabel *textLabel;

- (void)configureHeadeWithIndexPath:(NSIndexPath *)indexPath;

+ (CGSize)headeSizeForSection:(NSInteger)section;
@end
NS_ASSUME_NONNULL_END
