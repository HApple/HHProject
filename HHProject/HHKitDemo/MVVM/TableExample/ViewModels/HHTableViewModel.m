//
//  HHTableViewModel.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTableViewModel.h"
#import "HHTableExampleModel.h"
#import "HHTableViewController.h"
#import "HHTableExample.h"
#import "HHTableExample+Configure.h"

@implementation HHTableViewModel
- (NSInteger)hh_numberOfRowsInSection:(NSInteger)section {
    return [self.hh_dataSource count];
}

- (id)hh_itemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [self.hh_dataSource count]) {
        return self.hh_dataSource[indexPath.row];
    }
    return nil;
}

- (void)hh_HTTPActionWithSuccess:(void (^)())success
                      failure:(void (^)())failure {
    //模拟网络请求
    [self.hh_dataSource removeAllObjects];
    for (NSInteger i = 0; i < 20; i++) {
        HHTableExampleModel *model = [HHTableExampleModel new];
        [model setFaceURL:@"http://p4.music.126.net/FwWnlBZTsu8wMhtWp3BW8Q==/7704277976915321.jpg"];
        [model setIntro:@"Taylor Swift is one of the most popular singers in America. She is born in December 3rd, 1989. She is very young and beautiful. She is also very good at singing. Her songs are always countryside music, but there are also pop music, hip-hop, and rock. "];
        [self.hh_dataSource addObject:model];
    }
    
    if(self.hh_tableViewController.hh_dataSource != self.hh_dataSource){
         [self.hh_tableViewController.hh_dataSource removeAllObjects];
         [self.hh_tableViewController.hh_dataSource addObjectsFromArray:self.hh_dataSource];
    }
    
    NSLog(@"delegate %@,datasource %@",self.hh_tableViewController.hh_tableView.delegate,self.hh_tableViewController.hh_tableView.dataSource);
    NSLog(@"tableExample %@",[self tableExample].mvvmDelegate);
    
    [self.hh_tableViewController.hh_refreshControl hh_pulldownEndRefreshing];
    [self.hh_tableViewController.hh_tableView reloadData];
    
}

- (HHTableExample *)tableExample{
    return (HHTableExample *)self.hh_tableViewController;
}

@end
