//
//  GTListLoader.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData{
    NSString *urlString = @"https://blog.csdn.net/ancientear";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    //__unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    [dataTask resume];
    
}
//系统NSURLSession加载流程数据
/*
 1.创建&使用默认Session
 2.通过地址和参数创建Task
 3.开始&取消Task
 4.在Handler中处理数据
 */
@end
