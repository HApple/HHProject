//
//  HHUnionWebViewController.m
//  HTL
//
//  Created by huang on 2018/8/31.
//  Copyright © 2018年 FengYun. All rights reserved.
//

#import "HHUnionWebViewController.h"

@interface HHUnionWebViewController ()

@end

@implementation HHUnionWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    NSURL *url = navigationAction.request.URL;
    NSString *str = [url absoluteString];
    
    if ([str containsString:@"payDone.htm"]) {
        //支付成功，跳转页面
        
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}


@end
