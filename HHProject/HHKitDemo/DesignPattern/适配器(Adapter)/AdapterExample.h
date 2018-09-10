//
//  AdapterExample.h
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

// <http://ibloodline.com/articles/2016/09/20/Adapter.html>

/**
 适配器模式： 将一个类的接口转化为另一个类的接口，使得原本互不兼容的类可以通过接口一起工作。
 
 适配器用于连接两种不同种类的对象，使其毫无问题的协同工作。有时也称作为 包装器Wapper.
 
 基本上有了两种实现适配器的方式
 
 1.通过继承来适配两个接口，这称为类适配器
 
 2.第二种称为对象适配器，与类适配器不同，对象适配器不继承被适配者，而是组合了一个对它的引用。
 
 */


@interface AdapterExample : NSObject
@end


// ------------------------------------ 类适配器
// 普通充电器
@interface Charger : NSObject
- (void)charge; //普通充电
@end

@protocol LightningChargerAdapterProtocol <NSObject>
@required
- (void)chargeWithLighting; //声明适配方法
@end

//适配器继承Charger,实现 LightningChargerAdapterProtocol
@interface LightingChargerAdapter : Charger <LightningChargerAdapterProtocol>
@end



// -------------------------------------- 对象适配器
@protocol MicroUSBAdapterProtocol <NSObject>
@required
- (void)chargeWithMicroUSB;
@end

@interface MicroUSBAdapter : NSObject
- (void)chargeWithMicroUSB;
@end






