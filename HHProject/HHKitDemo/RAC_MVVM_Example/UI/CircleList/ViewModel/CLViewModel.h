//
//  CLViewModel.h
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHViewModel.h"
#import "CLHeaderViewModel.h"
#import "CLSectionHeaderViewModel.h"


@interface CLViewModel : HHViewModel

@property (nonatomic,strong) RACSubject *refreshEndSubject;

@property (nonatomic,strong) RACSubject *refreshUI;

@property (nonatomic,strong) RACCommand *refreshDataCommand;

@property (nonatomic,strong) RACCommand *nextPageCommand;

@property (nonatomic,strong) CLHeaderViewModel *listHeaderViewModel;

@property (nonatomic,strong) CLSectionHeaderViewModel *sectionHeaderViewModel;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) RACSubject *cellClickSubject;



@end
