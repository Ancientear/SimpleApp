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
     self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc]init];
//        label.text = @"Hello world";
//        [label sizeToFit];
//        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
//        label;
//    })];
    
    
    TestView * view = [[TestView alloc]init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100,100,100,100);
    [self.view addSubview:view];
    
    //为这个TestView小方框添加一个响应方法
    //建立一个手势，包含具体的方法
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    //把手势添加到当前view
    [view addGestureRecognizer:tapGesture];
    
}

- (void)pushController{
    //跳转到一个新的UIViewController。未定义则显示黑色
    //[self.navigationController pushViewController:[[UIViewController alloc]init] animated:YES];
    
    //定义一个新的UIViewController
    UIViewController *viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title  = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:viewController animated:YES];

}

@end
