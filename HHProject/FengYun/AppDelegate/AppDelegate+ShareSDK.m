//
//  AppDelegate+ShareSDK.m
//  HHProject
//
//  Created by huang on 2018/4/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "AppDelegate+ShareSDK.h"
/*
 appliance each SNS's Open Platform key，refer to：http://bbs.mob.com/forum.php?mod=viewthread&tid=275&page=1&extra=#pid860
 */

/** Share SDK */
static NSString * const kShareSDKAppKey = @"";
static NSString * const kShareSDKAppSecret = @"";

/**新浪微博*/
static NSString * const kSinaWeiboAppKey      = @"568898243";
static NSString * const kSinaWeiboAppSecret   = @"38a4f8204cc784f81f9f0daaf31e02e3";
static NSString * const kSinaWeiboRedirectUri = @"http://www.sharesdk.cn";


/**微信*/
static NSString * const kWeChatAppId  = @"wx4868b35061f87885";
static NSString * const kWeChatAppKey = @"64020361b8ec4c99936c0e3999a9f249";

/**QQ*/
static NSString * const kQQAppId  = @"100371282";
static NSString * const kQQAppKey  = @"aed9b0303e3ed1e27bae87c33761161d";


@implementation AppDelegate (ShareSDK)

- (void)registerActivePlatforms{
    
    
    
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeSinaWeibo),
                                        @(SSDKPlatformTypeWechat),
                                        @(SSDKPlatformTypeQQ),
                                       ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:kSinaWeiboAppKey
                                           appSecret:kSinaWeiboAppSecret
                                         redirectUri:kSinaWeiboRedirectUri
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:kWeChatAppId
                                       appSecret:kWeChatAppKey];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:kQQAppId
                                      appKey:kQQAppKey
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
    
}

- (void)showShare{
    
    //如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]
    NSArray* imageArray = @[[UIImage imageNamed:@"logo"]];
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"牛牛通宝投资发展有限公司是一家以人文科技为核心的专业投资机构。"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"www.baidu.com"]
                                          title:@"牛牛通宝"
                                           type:SSDKContentTypeAuto];
        //有的平台要客户端分享需要加此方法，例如微博
        [shareParams SSDKEnableUseClientShare];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];
    }
}
@end
