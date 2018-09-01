//
//  AppDelegate+Location.m
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate+Location.h"

@implementation AppDelegate (Location)

- (void)beginUpdateLocation{
    
    [[RHLocation shareLocationManage] beginUpdatingLocation];
    [RHLocation shareLocationManage].updatingLocationBlock = ^(Location *location) {

        [LoginManager sharedMgr].location = location;
    };
    
}

@end
