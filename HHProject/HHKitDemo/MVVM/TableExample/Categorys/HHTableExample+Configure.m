//
//  HHTableExample+Configure.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableExample+Configure.h"
#import "HHKit.h"
#import <objc/runtime.h>
#import "HHTableExampleCell.h"


@implementation HHTableExample (Configure)

- (void)configureTableView{
    
    HHWS(ws);
    [self.mvvmDelegate setHh_didSelectCellBlock:^(NSIndexPath *indexPath, id item){
        [(ws).mvvmEventDelegate hh_tableViewDidSelectCell:indexPath item:item];
        
    }];
    [self.mvvmViewModel hh_HTTPActionWithSuccess:nil failure:nil];
}


-(void)setMvvmEventDelegate:(HHTableEventDelegate *)mvvmEventDelegate{
    objc_setAssociatedObject(self, @selector(mvvmEventDelegate), mvvmEventDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HHTableEventDelegate *)mvvmEventDelegate{
    HHTableEventDelegate *_mvvmEventDelegate = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmEventDelegate);
    
    _mvvmEventDelegate = [[HHTableEventDelegate alloc] initWithViewController:self];
    objc_setAssociatedObject(self, _cmd, _mvvmEventDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmEventDelegate;
}


- (void)setMvvmDelegate:(HHTableDelegate *)mvvmDelegate{
    objc_setAssociatedObject(self, @selector(mvvmDelegate), mvvmDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HHTableDelegate *)mvvmDelegate{
    HHTableDelegate *_mvvmTableViewDelegate = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmTableViewDelegate);
    
    
    NSString *cellIdentifier = NSStringFromClass([HHTableExampleCell class]);
    _mvvmTableViewDelegate = [[HHTableDelegate alloc] initWithTableView:self.hh_tableView cellIdentifier:cellIdentifier viewModel:self.mvvmViewModel];
    objc_setAssociatedObject(self, _cmd, _mvvmTableViewDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmTableViewDelegate;

}

-(void)setMvvmViewModel:(HHTableViewModel *)mvvmViewModel{
    objc_setAssociatedObject(self, @selector(mvvmViewModel), mvvmViewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HHTableViewModel *)mvvmViewModel{
    HHTableViewModel *_mvvmViewModel = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmViewModel);
    _mvvmViewModel = [[HHTableViewModel alloc] initWithViewController:self dataSource:self.hh_dataSource];
    objc_setAssociatedObject(self, _cmd, _mvvmViewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmViewModel;
}


@end
