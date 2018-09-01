//
//  CLCollectionViewCell.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLCollectionViewCell.h"


@interface CLCollectionViewCell ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation CLCollectionViewCell


- (void)hh_setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    
    [self setupConstraints];

}

- (void)setupConstraints {
    
    CGFloat paddingEdge = 10;
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(80);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.headerImageView.mas_bottom).offset(paddingEdge);
        make.height.equalTo(15);
        make.left.right.equalTo(self.headerImageView);
    }];
    
}

- (void)setViewModel:(CLCollectionCellViewModel *)viewModel {
    
    if (!viewModel) {
        
        return;
    }
    
    _viewModel = viewModel;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.headerImageStr] placeholderImage:[UIImage imageNamed:@"yc_circle_placeHolder.png"]];
    self.nameLabel.text = viewModel.name;
}

- (void)setType:(NSString *)type {
    
    self.headerImageView.image = [UIImage imageNamed:@"circle_plus.png"];
    self.nameLabel.text = @"加入新圈子";

}


#pragma mark - lazyLoad
- (UIImageView *)headerImageView {
    
    if (!_headerImageView) {
        
        _headerImageView = [[UIImageView alloc] init];
    }
    
    return _headerImageView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = UIColorRGB(135, 135, 135);
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}
@end
