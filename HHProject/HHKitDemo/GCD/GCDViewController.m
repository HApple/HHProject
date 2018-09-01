//
//  GCDViewController.m
//  HHProject
//
//  Created by huang on 2018/8/1.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testProductAndConsumer]                                                                                                                                                                                                                                                                                                                                                                            ;
}

#pragma mark - dispatch_semaphore
/*
在多线程下控制多线程的并发数目
 1.创建信号量，可以设置信号量的资源数。0表示没有资源，调用 dispatch_semaphore_wait会立即等待
 dispatch_semaphore_t semaphore = dispatch_semaphore_create(0)
 
 2.等待信号，可以设置超时参数。 该函数返回0表示得到通知，非0表示超时。 dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER)
 
 3.通知信号，如果等待线程被唤醒则返回非0，否则返回0
 dispatch_semaphore_signal(semaphore)
*/
- (void)testDispatch_Semaphore{

    //比如每次执行10个任务，休息两秒
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10); // 信号总量是10
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); //信号量-1
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore); //信号量+1
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
}

-(void) testProductAndConsumer{
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    dispatch_queue_t producerQueue = dispatch_queue_create("producer", DISPATCH_QUEUE_CONCURRENT);//生产者线程跑的队列
    dispatch_queue_t consumerQueue = dispatch_queue_create("consumer", DISPATCH_QUEUE_CONCURRENT);//消费者线程跑的队列
    
    __block int cakeNumber = 0;
    dispatch_async(producerQueue,  ^{ //生产者队列
        while (1) {
            if (!dispatch_semaphore_signal(sem))
            {
                NSLog(@"Product:生产出了第%d个蛋糕",++cakeNumber);
                sleep(1); //wait for a while
                continue;
            }
        }
    });
    dispatch_async(consumerQueue,  ^{//消费者队列
        while (1) {
            if (dispatch_semaphore_wait(sem, dispatch_time(DISPATCH_TIME_NOW, 0*NSEC_PER_SEC))){
                if(cakeNumber > 0){
                    NSLog(@"Consumer:拿到了第%d个蛋糕",cakeNumber--);
                }
                continue;
            }
        }
    });
}

@end
