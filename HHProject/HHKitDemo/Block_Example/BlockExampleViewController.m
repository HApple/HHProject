//
//  BlockExampleViewController.m
//  HHProject
//
//  Created by huang on 2018/7/26.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "BlockExampleViewController.h"

@interface BlockExampleViewController ()

@end

@implementation BlockExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int paramVar = 1;
    
    [self testBlock:paramVar];
}

- (void)testBlock:(int)paramVar{
    
    __block int temp = 10;
    NSLog(@"%@",^{
        temp += 1;
        NSLog(@"%d",temp);
    });//__NSStackBlock__
    
    int var = 1;
    void (^block)(void) = ^{
        NSLog(@"%d",var);
    };
    NSLog(@"%@",block);//__NSMallocBlock__
    
    

}

@end
