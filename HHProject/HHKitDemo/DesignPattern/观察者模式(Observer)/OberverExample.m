//
//  OberverExample.m
//  HHProject
//
//  Created by huang on 2018/9/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "OberverExample.h"

#define kBossStatusNotificaiton @"kBossStatusNotificaiton"

@implementation Boss

-(void)setOutState:(NSInteger)outState{
    _outState = outState;
    [[NSNotificationCenter defaultCenter] postNotificationName:kBossStatusNotificaiton object:@(_outState)];
}

@end


@implementation Employee
- (instancetype)init{
    self = [super init];
    if (self) {
        
        //notification
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bossStatus:) name:kBossStatusNotificaiton object:nil];
        
    }
    return self;
}

//notification
- (void)bossStatus:(NSNotification *)notification{
    NSInteger status =  [notification.object integerValue];
    NSLog(@"notification ----  %@", status == 0 ? @"The boss went out." : @"The boss came back.");
}


//kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"outState"]) {
        NSInteger status =  [change[@"new"] integerValue];
        NSLog(@"kvo ----  %@", status == 0 ? @"The boss went out." : @"The boss came back.");
    }
}

@end


@interface OberverExample()
@property (nonatomic,strong) Boss *boss;
@property (nonatomic,strong) Employee *employee;
@end


@implementation OberverExample

- (void)dealloc{
    [self.boss removeObserver:self.employee forKeyPath:@"outState" context:NULL];
}

- (instancetype)init{

    self = [super init];
    if (self) {
        
        self.employee = [[Employee alloc] init];
        self.boss = [[Boss alloc] init];
       
        //kvo
        [self.boss addObserver:self.employee forKeyPath:@"outState" options:NSKeyValueObservingOptionNew context:NULL];
        
        self.boss.outState = 0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.boss.outState = 1;
        });
        
    }
    return self;
}

@end
