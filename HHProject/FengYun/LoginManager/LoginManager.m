//
//  LoginManager.m
//  XiangZhiGou
//
//  Created by huang on 2018/3/7.
//  Copyright © 2018年 徐岸. All rights reserved.
//

#import "LoginManager.h"
#import "FengYunConfig.h"
#import "SAMKeychain.h"
#import "UUID.h"

NSString * const kServiceName = @"XiangZhiGou";
NSString * const kAccount = @"account";
NSString * const kPassword = @"password";
NSString * const kLoginSuccessDate = @"loginScuccessDate";

static LoginManager *_loginMgr = nil;

@implementation LoginManager

+ (instancetype)sharedMgr{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loginMgr = [[LoginManager alloc] init];
    });
    return _loginMgr;
}

#pragma mark - 初始化
- (instancetype)init{
    if (self = [super init]) {
        _login = NO;
        NSUserDefaults *ud =  [NSUserDefaults standardUserDefaults];
        _account = [ud objectForKey:kAccount]?:@"";
        _password = [SAMKeychain passwordForService:kServiceName account:_account];
    }
    return self;
}


- (MyInfoModel *)infoModel{
    if (!_infoModel) {
        _infoModel = [[MyInfoModel alloc] init];
    }
    return _infoModel;
}

#pragma mark -更新密码
- (void)updatePassword:(NSString *)password{
    _password = password;
    [SAMKeychain setPassword:_password forService:kServiceName account:_account];
}

#pragma mark -保存账号 密码
- (void)saveAccount:(NSString *)account password:(NSString *)password{
    
    NSUserDefaults *ud =  [NSUserDefaults standardUserDefaults];
    _account = account;
    [ud setObject:account forKey:kAccount];
    [ud synchronize];
    
    _password = password;
    [SAMKeychain setPassword:_password forService:kServiceName account:_account];
    
    //登录成功 存储时间 七天后自动登录失效
    [ud setObject:[NSDate date] forKey:kLoginSuccessDate];
}


#pragma mark - 初始化接口
+ (void)initializeInterface:(void (^)(FYResponseData *data))block{
    
    [HHNetworkHelper clearHttpCookieStoage];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *uuidNo = [UUID getUUID];
    uuidNo = [uuidNo substringToIndex:8];
    
    NSString *signStr = [NSString stringWithFormat:@"%@%@%@%@%@",kInitCode,kClient,kAppVersion,uuidNo,kMd5Key];
    [parameters setObject:kInitCode forKey:kInitCodeKey];
    [parameters setObject:kClient forKey:@"sysclient"];//客户端类型
    [parameters setObject:kAppVersion forKey:@"sysversion"];//客户端版本号
    [parameters setObject:uuidNo forKey:@"sysserial"];//序列号
    [parameters setObject:signStr.md5Hash forKey:@"syssign"];//签名
    [parameters setObject:kMerNo forKey:@"merNo"];
    
    [HTTPRequest requestWithParameters:parameters success:^(FYResponseData *responseData) {
        
        if (responseData.success == YES) {
            
            [LoginManager sharedMgr].sessionid  =  responseData.respData[@"sessionid"];
            
            
            /*处理app升级*/
            [self handleUpdateApp:responseData.respData];
            
            
            if (block) {
                block(responseData);
            }
            
        }
        
        
    } failure:^(NSError *error) {
        
        LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"提示"
                                                            message:@"服务器异常,请重新启动app"
                                                              style:LGAlertViewStyleAlert
                                                       buttonTitles:nil
                                                  cancelButtonTitle:nil destructiveButtonTitle:nil];
        [alertView show];
        
        if (block) {
            block(nil);
        }
        
    }];
}

#pragma mark - 处理app升级
+ (void)handleUpdateApp:(NSDictionary *)respData{
    
    NSString *updateFlag = respData[@"updateFlag"];
    NSString *closeFlag = respData[@"closeFlag"];
    NSString *closeMsg = respData[@"closeMsg"];
    
    if ([closeFlag isEqualToString:@"1"]){
        
        LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"提示"
                                                            message:closeMsg
                                                              style:LGAlertViewStyleAlert
                                                       buttonTitles:nil
                                                  cancelButtonTitle:nil destructiveButtonTitle:nil];
        [alertView show];
        return;
    }
    
    if ([updateFlag integerValue] == 0 || [updateFlag integerValue] == 1) { //更新提示
        
        [NewEditionTestManager checkNewEditionWithAppID:kAppstoreId CustomAlert:^(AppStoreInfoModel *appInfo) {
           
            NSString *titleStr = [NSString stringWithFormat:@"APP版本%@,需要更新",appInfo.version];
            LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"提示"
                                                                message:titleStr
                                                                  style:LGAlertViewStyleAlert
                                                           buttonTitles:@[@"前往更新"]
                                                      cancelButtonTitle:@"暂不更新" destructiveButtonTitle:nil];
            [alertView show];
            alertView.actionHandler = ^(LGAlertView * _Nonnull alertView, NSUInteger index, NSString * _Nullable title) {
                if (index == 0) {
                    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appInfo.trackViewUrl]]) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appInfo.trackViewUrl] options:@{} completionHandler:nil];
                    }
                }
            };
        }];
        
    }else if ([updateFlag integerValue] == 9){//强制更新
            
        [NewEditionTestManager checkNewEditionWithAppID:kAppstoreId CustomAlert:^(AppStoreInfoModel *appInfo) {
            
            NSString *titleStr = [NSString stringWithFormat:@"APP版本%@,需要更新",appInfo.version];
            LGAlertView *alertView = [[LGAlertView alloc] initWithTitle:@"提示"
                                                                message:titleStr
                                                                  style:LGAlertViewStyleAlert
                                                           buttonTitles:@[@"确定"]
                                                      cancelButtonTitle:nil destructiveButtonTitle:nil];
            [alertView show];
            alertView.actionHandler = ^(LGAlertView * _Nonnull alertView, NSUInteger index, NSString * _Nullable title) {
                if (index == 0) {
                    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appInfo.trackViewUrl]]) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appInfo.trackViewUrl] options:@{} completionHandler:nil];
                    }
                }
            };
        }];
    }
    
    
    
}

#pragma mark - 退出账号
- (void)logOut{
    
    [self clear];
    [[self class] gotoLoginViewController];
    
}

- (void)clear{
    
    _password = @"";
    _login = NO;
    _infoModel = nil;
    _sessionid = nil;
    
    [SAMKeychain deletePasswordForService:kServiceName account:_account];
}

#pragma mark -  界面跳转处理
+ (void)gotoLoginViewController{
    //暂且这么处理
    Class class = NSClassFromString(kLoginClassName);
    HHAppDel.window.rootViewController = class.new;
}

@end
