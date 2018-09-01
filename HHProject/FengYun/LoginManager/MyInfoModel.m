//
//  MycenterInfoModel.m
//  NNtongbao
//
//  Created by NNCai on 2017/7/28.
//  Copyright © 2017年 NNCai. All rights reserved.
//

#import "MyInfoModel.h"

@implementation BankModel


- (void)clear{
    
    self.bk_no = @"";
    self.bkname = @"";
    self.bkbatch = @"";
    self.cs = @"";
    self.sf = @"";
}

@end

@implementation MyInfoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"UserCard" : [BankModel class] };
}

@end
