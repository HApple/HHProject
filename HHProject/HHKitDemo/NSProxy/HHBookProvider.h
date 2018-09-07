//
//  HHBookProvider.h
//  HHProject
//
//  Created by huang on 2018/9/5.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HHBookProviderProtocol

- (void)purchaseBookWithTitle:(NSString *)bookTitle;

@end


@interface HHBookProvider : NSObject<HHBookProviderProtocol>

@end
