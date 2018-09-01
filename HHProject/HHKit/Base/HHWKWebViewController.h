//
//  HHWKWebViewController.h
//  HHProject
//
//  Created by huang on 2018/8/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface HHWKWebViewController : UIViewController<WKNavigationDelegate,WKUIDelegate>

//加载外部链接
- (void)loadWebURLString:(NSString *)string;
//加载纯html
- (void)loadHtmlString:(NSString *)htmlString;

@end
