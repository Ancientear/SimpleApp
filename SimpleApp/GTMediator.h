//
//  GTMediator.h
//  SimpleApp
//
//  Created by 申凡 on 2021/5/3.
//

//这个类作为一个中转类
//组件化--列表和新闻详情的解耦

#import <UIKit/UIKit.h>
#import "Foundation/Foundation.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject
+ (__kindof UIViewController *)detailViewControllerwithUrl:(NSString *)detailUrl;

@end


NS_ASSUME_NONNULL_END
