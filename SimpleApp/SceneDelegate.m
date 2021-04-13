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
@interface SceneDelegate ()<UITabBarControllerDelegate>
//声明要使用的这个协议

@end

@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

	//ios13后初始化window方法需要改变
	UIWindowScene *windowScene = (UIWindowScene *)scene;
	self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
	self.window.frame = windowScene.coordinateSpace.bounds;
	UITabBarController *tabbarController = [[UITabBarController alloc]init];

	GTNewsViewController *newsViewController = [[GTNewsViewController alloc]init];

	GTVideoViewController *videoController = [[GTVideoViewController alloc]init];

	GTRecommendViewController *recommendcontroller = [[GTRecommendViewController alloc]init];



	UIViewController *mineViewController = [[UIViewController alloc]init];
	mineViewController.view.backgroundColor = [UIColor purpleColor];
	mineViewController.tabBarItem.title = @"我的";
	mineViewController.tabBarItem.image = [UIImage imageNamed:@"icons8-爱德华·蒙克-50.png"];
	mineViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icons8-kawaii-dinosaur-50.png"];


	tabbarController.viewControllers = @[newsViewController,videoController,recommendcontroller,mineViewController];

	//需要自定义执行tabbar的delegate方法是在当前的这个类中执行的
	//设计者：Delegate设计模式提供一些使用者可以自定义的操作，在对应的时机，让delegate执行对应方法。
	//使用者：设置.delegate = self按需实现方法
	tabbarController.delegate = self;

	//第一种方式
//    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:navigationController];
//    self.window.rootViewController = tabbarController;
	//第二种方式
	UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabbarController];
	self.window.rootViewController = navigationController;

	[self.window makeKeyAndVisible];

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	NSLog(@"did select");//终端输出命令，按需实现方法
}

- (void)sceneDidDisconnect:(UIScene *)scene {
	// Called as the scene is being released by the system.
	// This occurs shortly after the scene enters the background, or when its session is discarded.
	// Release any resources associated with this scene that can be re-created the next time the scene connects.
	// The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
	// Called when the scene has moved from an inactive state to an active state.
	// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
	// Called when the scene will move from an active state to an inactive state.
	// This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
	// Called as the scene transitions from the background to the foreground.
	// Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
	// Called as the scene transitions from the foreground to the background.
	// Use this method to save data, release shared resources, and store enough scene-specific state information
	// to restore the scene back to its current state.
}


@end
