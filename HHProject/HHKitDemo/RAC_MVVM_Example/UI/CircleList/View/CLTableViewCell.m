//
//  CLTableViewCell.m
//  HHProject
//
//  Created by huang on 2018/6/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLTableViewCell.h"

@interface CLTableViewCell ()

@property (nonatomic, strong) UIImageView *headerImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *articleImageView;

@property (nonatomic, strong) UILabel *articleLabel;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UILabel *peopleNumLabel;


@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIImageView *lineImageView;

@end
@implementation CLTableViewCell

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)hh_setupViews {
    
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.articleImageView];
    [self.contentView addSubview:self.articleLabel];
    [self.contentView addSubview:self.peopleImageView];
    [self.contentView addSubview:self.peopleNumLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.lineImageView];
    
    [self setupConstraints];

}

- (void)setupConstraints {
    
    CGFloat paddingEdge = 10;
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(paddingEdge);
        make.centerY.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(80, 80));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.headerImageView.mas_right).offset(paddingEdge);
        make.top.equalTo(self.headerImageView);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(15);
    }];
    
    [self.articleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.nameLabel);
        make.size.equalTo(CGSizeMake(15, 15));
        make.top.equalTo(self.nameLabel.mas_bottom).offset(paddingEdge);
    }];
    
    [self.articleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.articleImageView.mas_right).offset(3);
        make.size.equalTo(CGSizeMake(50, 15));
        make.centerY.equalTo(self.articleImageView);
    }];
    
    [self.peopleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.articleLabel.mas_right).offset(paddingEdge);
        make.size.equalTo(CGSizeMake(15, 15));
        make.centerY.equalTo(self.articleImageView);
    }];
    
    [self.peopleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.peopleImageView.mas_right).offset(3);
        make.centerY.equalTo(self.peopleImageView);
        make.size.equalTo(CGSizeMake(50, 15));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.articleImageView.mas_bottom).offset(paddingEdge);
        make.left.equalTo(self.articleImageView);
        make.right.equalTo(-paddingEdge);
        make.height.equalTo(15);
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.right.equalTo(self.contentView);
        make.height.equalTo(1.0);
    }];
  
}

- (void)setViewModel:(CLCollectionCellViewModel *)viewModel {
    
    if (!viewModel) {
        return;
    }
    
    _viewModel = viewModel;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.headerImageStr] placeholderImage:[UIImage imageNamed:@"yc_circle_placeHolder.png"]];
    self.nameLabel.text = viewModel.name;
    self.articleLabel.text = viewModel.articleNum;
    self.peopleNumLabel.text = viewModel.peopleNum;
    self.contentLabel.text = viewModel.content;
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
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return _nameLabel;
}

- (UIImageView *)articleImageView {
    
    if (!_articleImageView) {
        
        _articleImageView = [[UIImageView alloc] init];
        _articleImageView.backgroundColor = [UIColor redColor];
    }
    
    return _articleImageView;
}

- (UILabel *)articleLabel {
    
    if (!_articleLabel) {
        
        _articleLabel = [[UILabel alloc] init];
        _articleLabel.textColor = [UIColor lightGrayColor];
        _articleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _articleLabel;
}

- (UIImageView *)peopleImageView {
    
    if (!_peopleImageView) {
        
        _peopleImageView = [[UIImageView alloc] init];
        _peopleImageView.backgroundColor = [UIColor redColor];
    }
    
    return _peopleImageView;
}

- (UILabel *)peopleNumLabel {
    
    if (!_peopleNumLabel) {
        
        _peopleNumLabel = [[UILabel alloc] init];
        _peopleNumLabel.textColor = [UIColor lightGrayColor];
        _peopleNumLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _peopleNumLabel;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return _contentLabel;
}

- (UIImageView *)lineImageView {
    
    if (!_lineImageView) {
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return _lineImageView;
}

@end
