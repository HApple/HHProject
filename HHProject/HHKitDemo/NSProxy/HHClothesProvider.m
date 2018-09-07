//
//  HHClothesProvider.m
//  HHProject
//
//  Created by huang on 2018/9/5.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHClothesProvider.h"

@implementation HHClothesProvider

-(void)purchaseClothesWithSize:(HHClothesSize)size{
    NSString *sizeStr;
    switch (size) {
        case HHClothesSizeLarge:
            sizeStr = @"large size";
            break;
        case HHClothesSizeMedium:
            sizeStr = @"medium size";
            break;
        case HHClothesSizeSmall:
            sizeStr = @"small";
            break;
        default:
            break;
    }
    NSLog(@"You've bought some clothes of %@",sizeStr);
}

@end
