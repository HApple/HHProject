//
//  HHDealerProxy.h
//  HHProject
//
//  Created by huang on 2018/9/5.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHBookProvider.h"
#import "HHClothesProvider.h"


@interface HHDealerProxy : NSProxy<HHBookProviderProtocol,HHClothesProviderProtocol>

+ (instancetype)dealerProxy;

@end
