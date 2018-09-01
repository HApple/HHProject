//
//  AppDelegate+Location.h
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginManager.h"


/** Info.plist 添加描述
 
 <!-- Location Description  -->
 <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 <string>App需要您的同意,才能访问位置</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>App需要您的同意,才能访问位置</string>
 <key>NSLocationWhenInUseUsageDescription </key>
 <string>App需要您的同意,才能访问位置</string>
 
 */

@interface AppDelegate (Location)

/*在
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 方法中调用 beginUpdateLocation
 */
- (void)beginUpdateLocation;

@end
