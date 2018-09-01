//
//  HHCollectionExample+Configure.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionExample+Configure.h"
#import "HHKit.h"
#import <objc/runtime.h>

@implementation HHCollectionExample (Configure)

- (void)configureCollectionView{
    
    HHWS(ws);
    [self.mvvmDelegate setHh_didSelectCellBlcok:^(NSIndexPath *indexPath,id item){
        [ws.mvvmEventDelegate hh_tableViewDidSelectCell:indexPath item:item];
    }];
    
    [self.mvvmViewModel hh_HTTPActionWithSuccess:nil failure:nil];
}


-(void)setMvvmEventDelegate:(HHCollectionEventDelegate *)mvvmEventDelegate{
    objc_setAssociatedObject(self, @selector(mvvmEventDelegate), mvvmEventDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(HHCollectionEventDelegate *)mvvmEventDelegate{
    HHCollectionEventDelegate *_mvvmEventDelegate = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmEventDelegate);
    _mvvmEventDelegate = [[HHCollectionEventDelegate alloc] initWithViewController:self];
    objc_setAssociatedObject(self, _cmd, _mvvmEventDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmEventDelegate;
    
}

-(void)setMvvmViewModel:(HHCollectionViewModel *)mvvmViewModel{
    objc_setAssociatedObject(self, @selector(mvvmViewModel), mvvmViewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(HHCollectionViewModel *)mvvmViewModel{
    HHCollectionViewModel *_mvvmViewModel = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmViewModel);
    _mvvmViewModel = [[HHCollectionViewModel alloc] initWithViewController:self dataSource:self.hh_dataSource];
    objc_setAssociatedObject(self, _cmd, _mvvmViewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmViewModel;
}

-(void)setMvvmDelegate:(HHCollectionDelegate *)mvvmDelegate{
    objc_setAssociatedObject(self, @selector(mvvmDelegate), mvvmDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HHCollectionDelegate *)mvvmDelegate{
    HHCollectionDelegate *_mvvmDelegate = objc_getAssociatedObject(self, _cmd);
    HHGetMethodReturnObjc(_mvvmDelegate);
    _mvvmDelegate = [[HHCollectionDelegate alloc] initWithCollectionView:self.hh_collectionView
                                                    collectionViewLayout:self.hh_collectionViewLayout
                                                          cellIdentifier:@""
                                                               viewModel:self.mvvmViewModel];
    objc_setAssociatedObject(self, _cmd, _mvvmDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return _mvvmDelegate;
}

@end
