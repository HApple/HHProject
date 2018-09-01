//
//  AppDelegate+ShareSDK.h
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate.h"

/** 详细集成步骤

 1.手动           http://wiki.mob.com/快速集成/
 2.cocoapods     http://wiki.mob.com/cocoapods集成/
 */

 
 /**
 1、Log in to http://reg.sharesdk.cn/ to register to be a Mob developer , and click here to create a Mob application, then you will get the Appkey.
 2. Set MOBAppKey and MOBAppSecret in Info.plist
 3. appliance each SNS's Open Platform key，refer to：http://bbs.mob.com/forum.php?mod=viewthread&tid=275&page=1&extra=#pid860
 */

/** 申请 MOBAppKey/MOBAppSecret后
 调用registerAppKey:appSecret:方法
 
 或者在Info.plist 添加描述
 <!--  ShareSDK Description  -->
 <key>MOBAppKey</key>
 <string>2156b2ef0430c</string>
 <key>MOBAppSecret</key>
 <string>b5a45a64b78c85c3a74fe516a97929a0</string>
 */

#import <ShareSDK/ShareSDK.h>

//Links Native SDK use
#import <ShareSDKConnector/ShareSDKConnector.h>

#import <ShareSDKUI/ShareSDKUI.h>

//QQ SDK header file
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//Wechat SDK header file
#import "WXApi.h"

//SinaWeibo SDK header file
#import "WeiboSDK.h"

@interface AppDelegate (ShareSDK)

/*在
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
   方法中调用 registerActivePlatforms
 */
- (void)registerActivePlatforms;

/*
 创建分享内容示例
 */
- (void)showShare;

@end
