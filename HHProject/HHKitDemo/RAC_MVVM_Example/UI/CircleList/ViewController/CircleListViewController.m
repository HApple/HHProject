//
//  CircleListViewController.m
//  HHProject
//
//  Created by huang on 2018/6/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CircleListViewController.h"
#import "CLView.h"
#import "CLViewModel.h"

@interface CircleListViewController ()

@property (nonatomic,strong) CLView *mainView;

@property (nonatomic,strong) CLViewModel *viewModel;

@end

@implementation CircleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"圈子列表";
}


#pragma mark - system
- (void)updateViewConstraints{
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

#pragma mark - private
- (void)hh_addSubviews{
    [self.view addSubview:self.mainView];
}

- (void)hh_bindViewModel{
    
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        @strongify(self);
        HHViewController *vc = [[HHViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
}

#pragma mark - layzLoad
- (CLView *)mainView {
    
    if (!_mainView) {
        
        _mainView = [[CLView alloc] initWithViewModel:self.viewModel];
    }
    
    return _mainView;
}

- (CLViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[CLViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
