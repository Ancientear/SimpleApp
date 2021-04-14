//
//  GTListItem.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding
//实现反序列化
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super self];
	if (self) {
		self.category = [aDecoder decodeObjectForKey:@"category"];
		self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
		self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.date =[aDecoder decodeObjectForKey:@"date"];
		self.authorName= [aDecoder decodeObjectForKey:@"authorName"];
		self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
	}
	return self;
}
//实现序列化
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];


}

//安全性协议
+ (BOOL) supportsSecureCoding{
    return YES;
}



#pragma mark - public method
- (void)configWithDictionary:(NSDictionary *)dictionary {

#warning 类型是否匹配
	self.category = [dictionary objectForKey:@"category"];
	self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];;
	self.uniqueKey = [dictionary objectForKey:@"uniquekey"];;
	self.title = [dictionary objectForKey:@"title"];;
	self.date = [dictionary objectForKey:@"date"];;
	self.authorName= [dictionary objectForKey:@"author_name"];;
	self.articleUrl = [dictionary objectForKey:@"url"];;
}


@end
