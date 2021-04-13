//
//  SceneDelegate.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "SceneDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "MineViewController.h"
@interface SceneDelegate ()<UITabBarControllerDelegate>
//声明要使用的这个协议

@end

@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

	//初始化window方法
	UIWindowScene *windowScene = (UIWindowScene *)scene;
	self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
	self.window.frame = windowScene.coordinateSpace.bounds;
    
	UITabBarController *tabbarController = [[UITabBarController alloc]init];

	GTNewsViewController *newsViewController = [[GTNewsViewController alloc]init];
	GTVideoViewController *videoController = [[GTVideoViewController alloc]init];
	GTRecommendViewController *recommendcontroller = [[GTRecommendViewController alloc]init];
    MineViewController *mineViewController = [[MineViewController alloc]init];


	tabbarController.viewControllers = @[newsViewController,videoController,recommendcontroller,mineViewController];
	tabbarController.delegate = self;

    //UINavigationController是一个导航控制器，对ViewController进行栈管理
	UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    //设置窗口的根视图控制器
	self.window.rootViewController = navigationController;
    //使窗口可见
	[self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	NSLog(@"did select");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    
}


- (void)sceneDidBecomeActive:(UIScene *)scene {

}


- (void)sceneWillResignActive:(UIScene *)scene {

}


- (void)sceneWillEnterForeground:(UIScene *)scene {

}


- (void)sceneDidEnterBackground:(UIScene *)scene {

}


@end
