//
//  JKWKWebViewController.h
//  Pods
//
//  Created by Jack on 17/4/1.
//
//

#import <UIKit/UIKit.h>

/*
 
 JKWKWebViewController *jkVC = [JKWKWebViewController new];
 NSString *url = [NSString stringWithFormat:@"file://%@",[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]];
 jkVC.url = url;
 
 */

@interface JKWKWebViewController : UIViewController

@property (nonatomic,strong) NSString *url;

@end
