//
//  KeyChainStore.h

//  Created by FengYun on 2017/7/4.
//  Copyright © 2017年 FengYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end
