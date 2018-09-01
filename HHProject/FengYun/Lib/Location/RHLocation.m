//
//  RHLocation.m
//  NNtongbao
//
//  Created by NNCai on 2017/7/3.
//  Copyright © 2017年 NNCai. All rights reserved.
//

#import "RHLocation.h"

@interface RHLocation () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager * locationManager;
@end

@implementation RHLocation

static RHLocation*shareLocationMange;

+(RHLocation*)shareLocationManage
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareLocationMange=[[RHLocation alloc] init];
    });
    return shareLocationMange;
}



#pragma mark - public
- (void)beginUpdatingLocation {
    
    [self.locationManager startUpdatingLocation];
}

-(void)endUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - location delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    //获取新的位置
    CLLocation * newLocation = locations.lastObject;

    //创建自定制位置对象
    Location * location = [[Location alloc] init];
    
    //存储经度
    location.longitude = newLocation.coordinate.longitude;
    
    //存储纬度
    location.latitude = newLocation.coordinate.latitude;
    
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
    
    //根据经纬度反向地理编译出地址信息
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count > 0) {
            
            CLPlacemark * placemark = placemarks.firstObject;
            
            //存储位置信息
            location.country = placemark.country;
            location.administrativeArea = placemark.administrativeArea;
            location.locality = placemark.locality;
       
            location.subLocality = placemark.subLocality;
            location.thoroughfare = placemark.thoroughfare;
            location.subThoroughfare = placemark.subThoroughfare;
        
        }
        
        //设置代理方法
        if ([self.delegate respondsToSelector:@selector(locationDidEndUpdatingLocation:)]) {
            
            [self.delegate locationDidEndUpdatingLocation:location];
        }
        
    }];
    
   
    if (newLocation) {
         [[NSNotificationCenter defaultCenter] postNotificationName:LocationSeccedNotice object:location userInfo:nil];
        if (self.updatingLocationBlock) {
            self.updatingLocationBlock(location);
        }
    }
 
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败");
    NSMutableDictionary *userInfo=[NSMutableDictionary dictionary];
    userInfo[@"error"]=error;
    
    [self.locationManager startUpdatingLocation];
    
    //定位失败，通知定位失败
    [[NSNotificationCenter defaultCenter] postNotificationName:LocationFailedNotice object:nil userInfo:userInfo];
}

#pragma mark - setter and getter
- (CLLocationManager *)locationManager {
    
    if (!_locationManager) {
        
        _locationManager = [[CLLocationManager alloc] init];
        
        _locationManager.delegate = self;
        
        // 设置定位精确度
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        // 取得定位权限，有两个方法，取决于你的定位使用情况
        // 一个是 requestAlwaysAuthorization
        // 一个是 requestWhenInUseAuthorization
        [_locationManager requestAlwaysAuthorization];//ios8以上版本使用。
        [_locationManager requestWhenInUseAuthorization];
    }
    return _locationManager;
}
@end
