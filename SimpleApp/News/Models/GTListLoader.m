//
//  GTListLoader.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"
@implementation GTListLoader

- (void)loadListData{



    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

#warning 类型的检查
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"])objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for(NSDictionary *info in dataArray){
            GTListItem *listItem = [[GTListItem alloc]init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
            
        }
        NSLog(@"");
    }];
    
    [dataTask resume];
}
    
    
    ////封装好的AFNetworking
    //    [[AFHTTPSessionManager manager]GET:@"https://blog.csdn.net/ancientear" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    //
    //        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //
    //        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //
    //        }];

    
//系统NSURLSession加载流程数据
/*
 1.创建&使用默认Session
 2.通过地址和参数创建Task
 3.开始&取消Task
 4.在Handler中处理数据
 */

@end
