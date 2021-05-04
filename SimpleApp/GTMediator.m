//
//  GTMediator.m
//  SimpleApp
//
//  Created by 申凡 on 2021/5/3.
//

//这个类作为一个中转类
//组件化--列表和新闻详情的解耦
#import "GTMediator.h"


@implementation GTMediator
//依赖于GTDetailViewController，并没有彻底解耦,使用类的反射,通过一个字符串来反射它的class
+ (__kindof UIViewController *)detailViewControllerwithUrl:(NSString *)detailUrl{
    
    Class detailCls = NSClassFromString(@"GTDetailViewController");

    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}
@end

