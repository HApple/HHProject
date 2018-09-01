//
//  AppDelegate+UMPush.m
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate+UMPush.h"

@implementation AppDelegate (UMPush)

/** 初始化友盟推送设置*/
- (void)initUMengPushWithOptions:(NSDictionary *)launchOptions
{
    //开发者需要显式的调用此函数，日志系统才能工作
    [UMCommonLogManager setUpUMCommonLogManager];
    
// 是否打印 发布时必须设置为NO
#ifdef DEBUG
    [UMConfigure setLogEnabled:YES];
#else
    [UMConfigure setLogEnabled:NO];
#endif
    
    // 初始化友盟所有组件产品
    [UMConfigure initWithAppkey:kUMAppKey channel:nil];
    // 设置推送
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionSound|UMessageAuthorizationOptionAlert;
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"UMeng_Push 友盟推送的注册接口成功");
        }else
        {
            NSLog(@"UMeng_Push 友盟推送的注册接口失败error：%@",error);
        }
    }];
    
}

//iOS10以下使用这两个方法接收通知，
-(void)fy_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion] intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
        
        //    self.userInfo = userInfo;
        //    //定制自定的的弹出框
        //    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
        //    {
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"标题"
        //                                                            message:@"Test On ApplicationStateActive"
        //                                                           delegate:self
        //                                                  cancelButtonTitle:@"确定"
        //                                                  otherButtonTitles:nil];
        //
        //        [alertView show];
        //
        //    }
        completionHandler(UIBackgroundFetchResultNewData);
    }
}


//iOS10新增：处理前台收到通知的代理方法
-(void)fy_userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于前台时的远程推送接受
        //关闭U-Push自带的弹出框
        [UMessage setAutoAlert:NO];
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
    }else{
        //应用处于前台时的本地推送接受
    }
    //当应用处于前台时提示设置，需要哪个可以设置哪一个
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
-(void)fy_userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        
    }else{
        //应用处于后台时的本地推送接受
    }
}

@end
