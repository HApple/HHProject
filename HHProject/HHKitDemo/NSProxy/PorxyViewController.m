//
//  PorxyViewController.m
//  HHProject
//
//  Created by huang on 2018/9/5.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "PorxyViewController.h"
#import "HHDealerProxy.h"

@interface PorxyViewController ()

@end

@implementation PorxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HHDealerProxy *dealerProxy = [HHDealerProxy dealerProxy];
    [dealerProxy purchaseBookWithTitle:@"Swift 100 Tips"];
    [dealerProxy purchaseClothesWithSize:HHClothesSizeMedium];
    
}


@end
