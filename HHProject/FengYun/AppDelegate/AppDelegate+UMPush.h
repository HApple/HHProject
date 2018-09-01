//
//  AppDelegate+UMPush.h
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import <UMPush/UMessage.h>
#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogHeaders.h>


//http://mobile.umeng.com/custom_sdk

/**友盟Push配置
 1.https://developer.umeng.com/docs/66632/detail/66734
 2.点击项目---->TARGET---->Capabilities，将这里的Push Notification的开关打开
 3.打开Remote notifications background mode
 */


/** 友盟 */
static NSString * const kUMAppKey = @"596590eaa325113a51000628";

@interface AppDelegate (UMPush)<UNUserNotificationCenterDelegate>

/**  直接粘贴到 AppDelegate 里
 
 #pragma mark - Remote notificaiton
 //iOS10以下使用这两个方法接收通知，
 -(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
 {
 [self fy_application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
 }
 
 
 //iOS10新增：处理前台收到通知的代理方法
 -(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
 [self fy_userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
 }
 
 //iOS10新增：处理后台点击通知的代理方法
 -(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
 [self fy_userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
 }
 
 - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
 {
 //1.2.7版本开始不需要用户再手动注册devicetoken，SDK会自动注册
 NSLog(@"%@",[deviceToken description]);
 }
 
 */


/*  在
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    方法中调用 beginUpdateLocation
*/
- (void)initUMengPushWithOptions:(NSDictionary *)launchOptions;

-(void)fy_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

-(void)fy_userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler;

-(void)fy_userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler;

@end

