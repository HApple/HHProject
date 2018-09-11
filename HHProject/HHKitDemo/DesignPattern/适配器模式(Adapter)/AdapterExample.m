//
//  AdapterExample.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AdapterExample.h"


@implementation AdapterExample

- (instancetype)init{
    if (self = [super init]) {
        
        LightingChargerAdapter *charger = [[LightingChargerAdapter alloc] init];
        [charger chargeWithLighting];
        
        MicroUSBAdapter *usbAdapter = [[MicroUSBAdapter alloc] init];
        [usbAdapter chargeWithMicroUSB];
        
        
    }
    return self;
}

@end


#pragma mark - 类适配器
@implementation Charger
- (void)charge {
    NSLog(@"充电中");
}
@end



@implementation LightingChargerAdapter
- (void)chargeWithLighting{
    NSLog(@"使用Lightning");
    [super charge]; //调用父类的充电方法
}
@end



#pragma mark - 对象适配器
@interface MicroUSBAdapter() <MicroUSBAdapterProtocol>
@property (nonatomic,strong) Charger *charger;//持有Charger属性
@end

@implementation MicroUSBAdapter\
- (void)chargeWithMicroUSB{
    NSLog(@"使用MicroUSB");
    self.charger = [[Charger alloc] init];
    [self.charger charge];
}
@end



