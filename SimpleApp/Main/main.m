//
//  main.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Test.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    Test *te = [[Test alloc]init];
    [te run];
    
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
