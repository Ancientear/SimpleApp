//
//  Test.h
//  SimpleApp
//
//  Created by 申凡 on 2021/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject
+ (BOOL)resolveInstanceMethod:(SEL)sel;

+ (BOOL)resolveClassMethod:(SEL)sel;

- (void)run;
@end

NS_ASSUME_NONNULL_END
