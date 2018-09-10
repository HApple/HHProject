//
//  DesignPatternViewController.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "DesignPatternViewController.h"
#import "SingletonExample.h"
#import "OberverExample.h"
#import "DecoratorExample.h"

@interface DesignPatternViewController ()
@property (nonatomic,strong) OberverExample *oe;
@end

@implementation DesignPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SingletonExample *se = [SingletonExample sharedInstance];
    
    self.oe = [[OberverExample alloc] init];
    
    DecoratorExample *de = [[DecoratorExample alloc] init];
    
    
}

@end
