//
//  ViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "ViewController.h"

@interface TestView : UIView
@end


@implementation  TestView


- (instancetype)init{
    self = [super init];
    if(self){
    }
    return self;
}

//测试UIView的生命周期
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow :newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}

@end


@implementation ViewController

- (void)viewDidLoad {
//    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc]init];
//        label.text = @"Hello world";
//        [label sizeToFit];
//        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
//        label;
//    })];
    
    
//    TestView * view = [[TestView alloc]init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(100,100,100,100);
    //[self.view addSubview:view];
    
}

@end
