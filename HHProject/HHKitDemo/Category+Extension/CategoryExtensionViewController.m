//
//  CategoryExtensionViewController.m
//  HHProject
//
//  Created by huang on 2018/8/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "CategoryExtensionViewController.h"

/**
1.分类（category）的作用
1.1作用：可以在不修改原来类的基础上，为一个类扩展方法。
1.2最主要的用法：给系统自带的类扩展方法。
*/

/// ---  分类 
#import "NSString+HHCategory1.h"
#import "NSString+HHCategory2.h"
/// ---


/**
 和分类不同，类扩展即可以声明成员变量又可以声明方法。
 */
///  ---  拓展
@interface CategoryExtensionViewController ()

@property (nonatomic,strong) NSArray *array;
- (void)buttonAction;

@end

///

@implementation CategoryExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *str = @"123";
    [str description1];
    
    //NSString+HHCategory1 NSString+HHCategory2 都实现了同样的方法 description1
    //系统会调用位于complie sources最下面的那个类来执行
    //这里NSString+HHCategory1 位于下面 所以输出 HHCategory1

}

- (void)buttonAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
