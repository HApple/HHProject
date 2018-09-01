//
//  Dog.h
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    @public
    NSString *kind;
}

//_name + getter + setter 方法!
@property (nonatomic,copy) NSString *name;
@end
