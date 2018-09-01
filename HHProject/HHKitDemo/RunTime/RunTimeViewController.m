//
//  RunTimeViewController.m
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "RunTimeViewController.h"
#import "Person.h"
#import "NSURL+HOOK.h"
#import <objc/message.h>

@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *p = [[Person alloc] init];
   // [p eat:@"cookies"];
    objc_msgSend(p, @selector(eat:),@"cookies");
    
    
    NSURL *url = [NSURL URLWithString:nil];
    NSLog(@"url");
    
    
}

@end
