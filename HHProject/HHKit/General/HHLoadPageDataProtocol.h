//
//  HHLoadPageDataProtocol.h
//  HHProject
//
//  Created by huang on 2018/5/30.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HHLoadPageDataProtocol <NSObject>

@property (nonatomic,assign) NSInteger hh_PageNo;

@optional
- (void)hh_refreshPageData;

- (void)hh_loadNextPageData;

@end
