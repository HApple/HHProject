//
//  HHCollectionViewModel.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHCollectionViewModel.h"
#import "HHCollectionModel.h"
#import "HHCollectionViewController.h"

@implementation HHCollectionViewModel

//共有多少组 默认为1
- (NSInteger)hh_numberOfSections{
    return [self.hh_dataSource count];
}

//每组中显示多少个(UICollectionView)
- (NSInteger)hh_numberOfItemsInSection:(NSInteger)section{
    if ([self.hh_dataSource count] > section) {
        return [self.hh_dataSource[section] count];
    }
    return 0;
}

//根据索引返回item
- (nullable id)hh_itemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.hh_dataSource count] > indexPath.section) {
        NSArray *array = self.hh_dataSource[indexPath.section];
        return array[indexPath.row];
    }
    return nil;
}


- (void)hh_HTTPActionWithSuccess:(nullable void(^)())success failure:(nullable void(^)())failure{
    
    [self.hh_dataSource removeAllObjects];
    
    for (NSInteger i = 0; i < 3; i++) {
        NSMutableArray *tmpArrar = [NSMutableArray new];
        NSInteger count = 10;
        if (i == 1) count = 30;
        
        for (NSInteger j = 0; j < count; j++) {
            HHCollectionModel *model = [HHCollectionModel new];
            [model setFaceURL:@"http://p4.music.126.net/FwWnlBZTsu8wMhtWp3BW8Q==/7704277976915321.jpg"];
            [model setIntro:@"Taylor Swift is one of the most popular singers in America. She is born in December 3rd, 1989. She is very young and beautiful. She is also very good at singing. Her songs are always countryside music, but there are also pop music, hip-hop, and rock. "];
            [tmpArrar addObject:model];
        }
        [self.hh_dataSource addObject:tmpArrar];
    }
    
    [self.hh_collectionViewController.hh_refreshControl hh_pulldownEndRefreshing];
    [self.hh_collectionViewController.hh_collectionView reloadData];
    
}

@end
