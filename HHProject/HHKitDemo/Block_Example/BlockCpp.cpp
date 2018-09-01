////
////  BlockCpp.cpp
////  HHProject
////
////  Created by huang on 2018/7/27.
////  Copyright © 2018年 huang. All rights reserved.
////
//
//#include "BlockCpp.hpp"
//
//
////--------------OC
////int main()
////{
////    void (^blk)(void) = ^{
////        printf("Block\n");
////    };
////}
//
//
//
//
////---------------C++
//
//struct __block_impl {
//    void *isa;      //isa指针，所有对象都有该指针，用于实现对象相关的功能
//    int Flags;      //用于按bit位表示一些block的附加信息，block copy的实现代码可以看到对该变量的使用
//    int Reserved;   //保留变量
//    void *FuncPtr;  //
//};
//
////block结构体
//struct __main_block_impl_0 {
//    
//    struct __block_impl impl;
//    
//    struct __main_block_desc_0* Desc;
//    
//    //Block构造函数
//    __main_block_impl_0(void *fp,struct __main_block_desc_0 *desc, int flags = 0){
//        
//        impl.isa = &_NSConcreteStackBlock; //isa指针
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = desc;
//    };
//};
//
////将来被调用的block内部的代码： block值被转换为C的函数代码
//static void __main__block_func_0(struct __main_block_impl_0 *__cself) {
//    printf("Block\n");
//}
//
//
//static struct __main_block_desc_0 {
// 
//    size_t reserved;
//    size_t Block_size;
//} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
//
//
////main函数
//int main()
//{
//    void (*blk)(void) = ((void(*)()))&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA);
//    return 0;
//}
//
//
//
//
//
//
//
//
//
