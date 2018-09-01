//
//  RACSecondViewController.m
//  HHProject
//
//  Created by huang on 2018/5/29.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "RACSecondViewController.h"

@interface RACSecondViewController ()

@end

@implementation RACSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.subject sendNext:@"hello huang"];
    
}



@end
