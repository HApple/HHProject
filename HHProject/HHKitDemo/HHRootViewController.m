//
//  HHRootViewController.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/7.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHRootViewController.h"
#import "ViewController1.h"

@interface HHRootViewController ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation HHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HHKit Example";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    [self addCell:@"TCP" class:@"HHTCPExample"];
    [self addCell:@"Encryptions" class:@"EncryptionsExample"];
    [self addCell:@"ViewController Life Cycle" class:@"ViewController1"];
    [self addCell:@"ReactiveCocoa" class:@"RACViewController"];
    [self addCell:@"RAC_MVVM" class:@"CircleListViewController"];
    [self addCell:@"Block Example" class:@"BlockExampleViewController"];
    [self addCell:@"RunTime Example" class:@"RunTimeViewController"];
    [self addCell:@"RunLoop Example" class:@"RunLoopViewController"];
    [self addCell:@"GCD Example" class:@"GCDViewController"];
    [self addCell:@"KVO Example" class:@"KVOViewController"];
    [self addCell:@"Category Extension Example" class:@"CategoryExtensionViewController"];
    [self.tableView reloadData];
}



- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HH"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HH"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    if ([className isEqualToString:@"HHTCPExample"] ||
        [className isEqualToString:@"EncryptionsExample"] ||
        [className isEqualToString:@"RACViewController"]) {
        
       UIViewController *ctrl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:className];
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
        return;
        
    }
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

