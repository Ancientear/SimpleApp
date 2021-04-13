//
//  GTListItem.h
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//列表结构化数据
@interface GTListItem : NSObject

@property(nonatomic,copy,readwrite) NSString * category;
@property(nonatomic,copy,readwrite) NSString * picUrl;
@property(nonatomic,copy,readwrite) NSString * uniqueKey;
@property(nonatomic,copy,readwrite) NSString * title;
@property(nonatomic,copy,readwrite) NSString * date;
@property(nonatomic,copy,readwrite) NSString * authorName;
@property(nonatomic,copy,readwrite) NSString * articleUrl;

//解析dictionary对应赋值上面的属性
- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
