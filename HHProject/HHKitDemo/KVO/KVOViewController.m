//
//  KVOViewController.m
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "KVOViewController.h"
#import "Dog.h"

@interface KVOViewController ()

@property (nonatomic,strong) Dog *dog;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.dog = [[Dog alloc] init];
    [self.dog addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"name"]) {
        
        NSString *name =  change[NSKeyValueChangeNewKey];
        NSLog(@"%@",name);
    }
    else if ([keyPath isEqualToString:@"kind"]) {
        
        NSString *kind =  change[NSKeyValueChangeNewKey];
        NSLog(@"%@",kind);
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _dog->kind = @"Zh"; //监听成员变量无效
    self.dog.name = @"Laifu";
   
}

//反转字符串

void char_reverse(char *cha)
{
    //指向第一个字符
    char *begin = cha;
    //指向最后一个字符
    char *end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        //交换前后两个字符，同时移动指针
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
    
}

- (void)merge{
    //有序数组归并
    int a[5] = {1,4,6,7,9};
    int b[8] = {2,3,5,6,8,10,11,12};
    
    //用于存储归并结果
    int result[13];
    //归并操作
    mergeList(a, 5, b, 8, result);
    for (int i = 0; i < 13; i++) {
        printf("%d",result[i]);
    }
}

void mergeList(int a[], int alen, int b[], int bLen, int result[])
{
    int p = 0; //遍历数组a的指针
    int q = 0; //遍历数组b的指针
    int i = 0; //记录当前存储位置
    
    //任一数组没有达到边界则进行遍历
    while (p < alen && q < bLen) {
        //如果a数组对应位置的值小于b数组对应位置的值
        if (a[p] <= b[q]) {
            //存储a数组的值
            result[i] = a[p];
            //移动a数组的遍历指针
            p++;
        }else{
            //存储b数组的值
            result[i] = b[q];
            //移动b数组的遍历指针
            q++;
        }
        //指向合并结果的下一个存储位置
        i++;
    }
    
    //如果a数组有剩余
    while (p < alen) {
        //将a数组剩余部分拼接到合并结果的后面
        result[i] = a[p++];
        i++;
    }
    
    //如果b数组有剩余
    while (q < bLen) {
        //将b数组剩余部分拼接到合并结果的后面
        result[i] = a[q++];
        i++;
    }
}


@end
