//
//  CLViewModel.m
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CLViewModel.h"
#import "CLCollectionCellViewModel.h"

@interface CLViewModel()

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation CLViewModel


- (void)hh_initialize{
    
    @weakify(self);
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dic) {
        
        @strongify(self);
        
        NSMutableArray *alArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 8; i++) {
            
            CLCollectionCellViewModel *viewModel = [[CLCollectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            [alArray addObject:viewModel];
        }
        
        self.listHeaderViewModel.dataArray = alArray;
        
        NSMutableArray *reArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 8; i++) {
            
            CLCollectionCellViewModel *viewModel = [[CLCollectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:viewModel];
        }
        
        self.dataArray = reArray;
        
        [self.listHeaderViewModel.refreshUISubject sendNext:nil];
        [self.refreshEndSubject sendNext:@(HHFooterRefresh_HasMoreData)];
        
        [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
           
            if ([x boolValue] == YES) {
                
                [HHProgressHUD showMessage:@"正在加载"];
                
            }
            
        }];
    }];
    
    [self.nextPageCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dic) {
        
        @strongify(self);
        
        NSMutableArray *reArray = [[NSMutableArray alloc] initWithArray:self.dataArray];
        for (int i = 0; i < 8; i++) {
            
            CLCollectionCellViewModel *viewModel = [[CLCollectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:viewModel];
        }
        
        self.dataArray = reArray;
        [self.refreshEndSubject sendNext:@(HHFooterRefresh_HasMoreData)];
    }];
    
}

#pragma mark - Lazy Load

-(RACSubject *)refreshUI{
    
    if (!_refreshUI) {
        
        _refreshUI = [RACSubject subject];
    }
    
    return _refreshUI;
}

- (RACSubject *)refreshEndSubject{
    
    if (!_refreshEndSubject) {
        
        _refreshEndSubject = [RACSubject subject];
    }
    
    return _refreshEndSubject;
}

-(RACCommand *)refreshDataCommand{
    
    if (!_refreshDataCommand) {
        
        @weakify(self);
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
           
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                self.currentPage = 1;
                //https://www.apiopen.top/satinCommentApi?id=27610708&page=1
                
                [HTTPRequest requestWithParameters:@{kApiPreUrlKey:@"https://www.apiopen.top/satinCommentApi",
                                                     @"page":@(self.currentPage),
                                                     @"id":@(27610708)
                                                     }
                                           success:^(FYResponseData *responseData) {
                                               
                                               [subscriber sendNext:responseData.respData];
                                               [subscriber sendCompleted];

                                           } failure:^(NSError *error) {
                                               
                                               [HHProgressHUD showMessage:@"网络连接失败"];
                                               [subscriber sendCompleted];
                                               
                                           }];

                return [RACDisposable disposableWithBlock:^{
                    
                }];
            }];
    
        }];
        
    }
    
    return _refreshDataCommand;
}

-(RACCommand *)AnextPageCommand{
    
    if (!_nextPageCommand) {
    
        @weakify(self);
        _nextPageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
                @strongify(self);
                self.currentPage += 1;
                [HTTPRequest requestWithParameters:@{kApiPreUrlKey:@"https://www.apiopen.top/satinCommentApi",
                                                     @"page":@(self.currentPage),
                                                     @"id":@(27610708)
                                                     }
                                           success:^(FYResponseData *responseData) {
                                               
                                               [subscriber sendNext:responseData.respData];
                                               [subscriber sendCompleted];
                                               
                                               
                                           } failure:^(NSError *error) {
                                               
                                               self.currentPage -= 1;
                                               [HHProgressHUD showMessage:@"网络连接失败"];
                                               [subscriber sendCompleted];
                                               
                                           }];
                
                
                return nil;
                
            }];
            
        }];
        
    }
    return _nextPageCommand;
}


- (CLHeaderViewModel *)listHeaderViewModel {
    
    if (!_listHeaderViewModel) {
        
        _listHeaderViewModel = [[CLHeaderViewModel alloc] init];
        _listHeaderViewModel.title = @"已加入的圈子";
        _listHeaderViewModel.cellClickSubject = self.cellClickSubject;
    }
    
    return _listHeaderViewModel;
}

- (CLSectionHeaderViewModel *)sectionHeaderViewModel {
    
    if (!_sectionHeaderViewModel) {
        
        _sectionHeaderViewModel = [[CLSectionHeaderViewModel alloc] init];
        _sectionHeaderViewModel.title = @"推荐圈子";
    }
    
    return _sectionHeaderViewModel;
}

- (NSArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [[NSArray alloc] init];
    }
    
    return _dataArray;
}

- (RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
        
        _cellClickSubject = [RACSubject subject];
    }
    
    return _cellClickSubject;
}
@end
