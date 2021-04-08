//
//  ViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc]init];
        label.text = @"Hello world";
        [label sizeToFit];
        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height /2);
        label;
    })];
}


@end
