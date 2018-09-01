//
//  HHMVVMExample.m
//  HHProject
//
//  Created by Jn.Huang on 2017/6/8.
//  Copyright © 2017年 huang. All rights reserved.
//

#import "HHMVVMExample.h"
#import "HHCollectionExample.h"

@interface HHMVVMExample ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation HHMVVMExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM Example";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    [self addCell:@"TableViewController" class:@"HHTableExample"];
    [self addCell:@"CollectionViewController" class:@"HHCollectionExample"];
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
    if ([className isEqualToString:@"HHCollectionExample"]) {
        HHCollectionExample *ctrl = [[HHCollectionExample alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
