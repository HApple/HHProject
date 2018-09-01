//
//  HHWKWebViewController.m
//  HHProject
//
//  Created by huang on 2018/8/31.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HHWKWebViewController.h"

typedef NS_ENUM(NSInteger,WKWebLoadType) {
    WKWebLoadType_Url,
    WKWebLoadType_HtmlString
};

@interface HHWKWebViewController()

@property (nonatomic,strong) WKWebView *wkWebView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,assign) WKWebLoadType wkLoadType;
@property (nonatomic,copy) NSString *htmlString;
@property (nonatomic,copy) NSString *urlString;

@end

@implementation HHWKWebViewController

#pragma mark - Life Cycle
- (void)dealloc{
    [self.wkWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.wkWebView.navigationDelegate = nil;
    self.wkWebView.UIDelegate = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.wkWebView.navigationDelegate = self;
    self.wkWebView.UIDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.wkWebView];
    [self.view addSubview:self.progressView];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.wkWebView.frame = self.view.bounds;
    self.progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3);
}

#pragma mark - Private Methods
- (void)loadWKWebView{
    
    if (self.wkLoadType == WKWebLoadType_Url) {
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]];
        [self.wkWebView loadRequest:request];
        
    }else if(self.wkLoadType == WKWebLoadType_HtmlString){
        
        [self.wkWebView loadHTMLString:self.htmlString baseURL:nil];
        
    }
    
}

#pragma mark - Public Methods
- (void)loadWebURLString:(NSString *)string{
    self.wkLoadType = WKWebLoadType_Url;
    self.urlString = string;
}


- (void)loadHtmlString:(NSString *)htmlString{
    self.wkLoadType = WKWebLoadType_HtmlString;
    self.htmlString = htmlString;
}

#pragma mark - WKNavigationDelegate 主要处理页面跳转相关事件
//判断链接是否允许跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{}

//拿到响应后决定是否允许跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{}

//链接开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{}

//收到服务器重定向时调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{}

//加载错误时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{}

//当内容开始到达主帧时被调用（即将完成）
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{}

//在提交的主帧中发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{}

//当webView需要响应身份验证时调用(如需验证服务器证书)
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{}

//当webView的web内容进程被终止时调用。(iOS 9.0之后)
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0)){}




#pragma mark - WKUIDelegate 主要处理一些页面上的事件，如警告框、对话框等。
//接收到警告面板
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{}
//接收到确认面板
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{}

//接收到输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler{}


#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.wkWebView) {
        
        self.progressView.alpha = 1.0f;
        BOOL animated = self.wkWebView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.wkWebView.estimatedProgress animated:animated];
        
        if (self.wkWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.progressView.alpha = 0.0f;
                
            } completion:^(BOOL finished) {
                
                [self.progressView setProgress:0.0f animated:NO];
                
            }];
        }
    }else{
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}


#pragma mark - Lazy
-(WKWebView *)wkWebView{
    if (!_wkWebView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
        [_wkWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _wkWebView;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.trackTintColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0];
        _progressView.progressTintColor = [UIColor greenColor];
    }
    return _progressView;
}
@end
