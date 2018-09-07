//
//  HHClothesProvider.h
//  HHProject
//
//  Created by huang on 2018/9/5.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HHClothesSize) {
    HHClothesSizeSmall = 0,
    HHClothesSizeMedium,
    HHClothesSizeLarge
};

@protocol HHClothesProviderProtocol

- (void)purchaseClothesWithSize:(HHClothesSize)size;

@end

@interface HHClothesProvider : NSObject<HHClothesProviderProtocol>



@end
