//
//  Test.m
//  SimpleApp
//
//  Created by 申凡 on 2021/5/24.
//

#import "Test.h"
#import <objc/runtime.h>

@interface Test()

@end
@implementation Test



void run (id self, SEL _cmd) {

    NSLog(@"跑");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if(sel == @selector(run)){
        class_addMethod(self, sel, (IMP)run, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}



@end
