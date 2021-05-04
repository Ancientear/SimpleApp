//
//  GTMediator.m
//  SimpleApp
//
//  Created by 申凡 on 2021/5/3.
//

//这个类作为一个中转类
//组件化--列表和新闻详情的解耦
#import "GTMediator.h"
#import "GTDetailViewController.h"


@implementation GTMediator
+ (__kindof UIViewController *)detailViewControllerwithUrl:(NSString *)detailUrl{
    GTDetailViewController *controller = [[GTDetailViewController alloc]initWithUrlString:detailUrl];
    return controller;
}
@end

