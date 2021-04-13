//
//  MineViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/13.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor purpleColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icons8-爱德华·蒙克-50.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icons8-kawaii-dinosaur-50.png"];
    }
    return self;
}

@end
