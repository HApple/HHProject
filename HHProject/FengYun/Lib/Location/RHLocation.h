//
//  RHLocation.h
//  NNtongbao
//
//  Created by NNCai on 2017/7/3.
//  Copyright © 2017年 NNCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

#define LocationSeccedNotice  @"LocationSecced"
#define LocationFailedNotice  @"LocationFailed"
#define LocationFunctionNotNotAvailable @"LocationFuncationNotAvailable"


@protocol RHLocationDelegate <NSObject>

- (void)locationDidEndUpdatingLocation:(Location *)location;

@end

@interface RHLocation : NSObject

@property (nonatomic, weak) id<RHLocationDelegate> delegate;
@property (nonatomic,copy)void (^updatingLocationBlock)(Location *location);

+(RHLocation*)shareLocationManage;
- (void)beginUpdatingLocation;
-(void)endUpdatingLocation;

@end
