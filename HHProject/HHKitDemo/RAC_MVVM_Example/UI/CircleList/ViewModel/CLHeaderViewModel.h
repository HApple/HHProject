//
//  CLHeaderViewModel.h
//  HHProject
//
//  Created by huang on 2018/5/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHViewModel.h"

@interface CLHeaderViewModel : HHViewModel

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) RACSubject *refreshUISubject;

@property (nonatomic,strong) RACSubject *cellClickSubject;

@end
