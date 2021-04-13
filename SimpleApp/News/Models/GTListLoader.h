//
//  GTListLoader.h
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import <Foundation/Foundation.h>

@class  GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success,NSArray<GTListItem *> *dataArrray);
//列表请求
@interface GTListLoader : NSObject
//传入这个GTListLoaderFinishBlock，就是当我们加载数据，然后通过block去处理它整个的数据解析
- (void)GTListLoaderFinishBlock:(GTListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
