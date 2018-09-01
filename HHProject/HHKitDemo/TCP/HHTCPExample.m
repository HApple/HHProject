//
//  HHTCPExample.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/7.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHTCPExample.h"
#import "HTTPRequest.h"

static NSString *const dataUrl = @"http://api.budejie.com/api/api_open.php";
static NSString *const downloadUrl = @"http://sw.bos.baidu.com/sw-search-sp/software/447feea06f61e/QQ_mac_5.5.1.dmg";

@interface HHTCPExample ()

@property (weak, nonatomic) IBOutlet UITextView *networkData;
@property (weak, nonatomic) IBOutlet UITextView *cacheData;
@property (weak, nonatomic) IBOutlet UILabel *cacheStatus;
@property (weak, nonatomic) IBOutlet UISwitch *cacheSwitch;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

/** 是否开启缓存*/
@property (nonatomic, assign, getter=isCache) BOOL cache;

/** 是否开始下载*/
@property (nonatomic, assign, getter=isDownload) BOOL download;
@end

@implementation HHTCPExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    /**
     设置网络请求参数的格式:默认为二进制格式
     HHRequestSerializerJSON(JSON格式),
     HHRequestSerializerHTTP(二进制格式)
     
     设置方式 : [HHNetworkHelper setRequestSerializer:HHRequestSerializerHTTP];
     */
    /**
     设置服务器响应数据格式:默认为JSON格式
     HHResponseSerializerJSON(JSON格式),
     HHResponseSerializerHTTP(二进制格式)
     
     设置方式 : [HHNetworkHelper setResponseSerializer:HHResponseSerializerJSON];
     */
    
    /**
     设置请求头 : [HHNetworkHelper setValue:@"value" forHTTPHeaderField:@"header"];
     */
    
    // 开启日志打印
    [HHNetworkHelper openLog];
    
    // 获取网络缓存大小
    HHLog(@"网络缓存大小cache = %fKB",[HHNetworkCache getAllHttpCacheSize]/1024.f);
    
    // 清理缓存 [HHNetworkCache removeAllHttpCache];
    
    // 实时监测网络状态
    [self monitorNetworkStatus];
    
    /*
     * 一次性获取当前网络状态
     这里延时0.1s再执行是因为程序刚刚启动,可能相关的网络服务还没有初始化完成(也有可能是AFN的BUG),
     导致此demo检测的网络状态不正确,这仅仅只是为了演示demo的功能性, 在实际使用中可直接使用一次性网络判断,不用延时
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getCurrentNetworkStatus];
    });
    
   [self HHHTTPRequestLayerDemo];
}

/**
 
 通过封装好的网络层进行请求配 , 我目前的项目是这样做的,在工程中的 HHHTTPRequestLayer 文件夹可以看到
 当然,不同的项目可以有不同的做法,没有最好的做法,只有最合适的做法,
 这仅仅是我抛砖引玉, 希望大家能各显神通.
 */
- (void)HHHTTPRequestLayerDemo
{

}


#pragma  mark - 获取数据请求示例 GET请求自动缓存与无缓存
#pragma  mark - 这里的请求只是一个演示, 在真实的项目中建议不要这样做, 具体做法可以参照HHHTTPRequestLayer文件夹的例子
- (void)getData:(BOOL)isOn url:(NSString *)url
{
    
    NSDictionary *para = @{ @"a":@"list", @"c":@"data",@"client":@"iphone",@"page":@"0",@"per":@"10", @"type":@"29"};
    // 自动缓存
    if(isOn)
    {
        self.cacheStatus.text = @"缓存打开";
        self.cacheSwitch.on = YES;
        [HHNetworkHelper GET:url parameters:para responseCache:^(id responseCache) {
            // 1.先加载缓存数据
            self.cacheData.text = [self jsonToString:responseCache];
        } success:^(id responseObject) {
            // 2.再请求网络数据
            self.networkData.text = [self jsonToString:responseObject];
        } failure:^(NSError *error) {
            
        }];
        
    }
    // 无缓存
    else
    {
        self.cacheStatus.text = @"缓存关闭";
        self.cacheSwitch.on = NO;
        self.cacheData.text = @"";
        
        [HHNetworkHelper GET:url parameters:para success:^(id responseObject) {
            self.networkData.text = [self jsonToString:responseObject];
        } failure:^(NSError *error) {
            
        }];
        
    }
    
}
#pragma mark - 实时监测网络状态
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [HHNetworkHelper networkStatusWithBlock:^(HHNetworkStatusType networkStatus) {
        
        switch (networkStatus) {
                // 未知网络
            case HHNetworkStatusUnknown:
                // 无网络
            case HHNetworkStatusNotReachable:
                self.networkData.text = @"没有网络";
                [self getData:YES url:dataUrl];
                HHLog(@"无网络,加载缓存数据");
                break;
                // 手机网络
            case HHNetworkStatusReachableViaWWAN:
                // 无线网络
            case HHNetworkStatusReachableViaWiFi:
                [self getData:[[NSUserDefaults standardUserDefaults] boolForKey:@"isOn"] url:dataUrl];
                HHLog(@"有网络,请求网络数据");
                break;
        }
        
    }];
    
}

#pragma mark - 一次性获取当前最新网络状态
- (void)getCurrentNetworkStatus
{
    if (kIsNetwork) {
        HHLog(@"有网络");
        if (kIsWWANNetwork) {
            HHLog(@"手机网络");
        }else if (kIsWiFiNetwork){
            HHLog(@"WiFi网络");
        }
    } else {
        HHLog(@"无网络");
    }
    // 或
    //    if ([HHNetworkHelper isNetwork]) {
    //        HHLog(@"有网络");
    //        if ([HHNetworkHelper isWWANNetwork]) {
    //            HHLog(@"手机网络");
    //        }else if ([HHNetworkHelper isWiFiNetwork]){
    //            HHLog(@"WiFi网络");
    //        }
    //    } else {
    //        HHLog(@"无网络");
    //    }
}

#pragma mark - 下载

- (IBAction)download:(UIButton *)sender {
    
    static NSURLSessionTask *task = nil;
    //开始下载
    if(!self.isDownload)
    {
        self.download = YES;
        [self.downloadBtn setTitle:@"取消下载" forState:UIControlStateNormal];
        
        task = [HHNetworkHelper downloadWithURL:downloadUrl fileDir:@"Download" progress:^(NSProgress *progress) {
            
            CGFloat stauts = 100.f * progress.completedUnitCount/progress.totalUnitCount;
            self.progress.progress = stauts/100.f;
            
            HHLog(@"下载进度 :%.2f%%,,%@",stauts,[NSThread currentThread]);
        } success:^(NSString *filePath) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"下载完成!"
                                                                message:[NSString stringWithFormat:@"文件路径:%@",filePath]
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
            [self.downloadBtn setTitle:@"重新下载" forState:UIControlStateNormal];
            HHLog(@"filePath = %@",filePath);
            
        } failure:^(NSError *error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"下载失败"
                                                                message:[NSString stringWithFormat:@"%@",error]
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
            HHLog(@"error = %@",error);
        }];
        
    }
    //暂停下载
    else
    {
        self.download = NO;
        [task suspend];
        self.progress.progress = 0;
        [self.downloadBtn setTitle:@"开始下载" forState:UIControlStateNormal];
    }
    
    
    
}

#pragma mark - 缓存开关
- (IBAction)isCache:(UISwitch *)sender {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:sender.isOn forKey:@"isOn"];
    [userDefault synchronize];
    
    [self getData:sender.isOn url:dataUrl];
}

/**
 *  json转字符串
 */
- (NSString *)jsonToString:(NSDictionary *)dic
{
    if(!dic){
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



@end
