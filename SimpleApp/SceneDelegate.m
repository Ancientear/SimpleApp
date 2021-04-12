//
//  SceneDelegate.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
@interface SceneDelegate ()<UITabBarControllerDelegate>
//声明要使用的这个协议

@end

@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    //ios13前
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor redColor];
    
    
    //ios13后初始化window方法需要改变
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
   
    //这里的“新闻”首页就变成了viewController里的界面了
    ViewController *viewController = [[ViewController alloc]init];
    

//    UIViewController *controller1 = [[UIViewController alloc]init];
//    controller1.view.backgroundColor = [UIColor redColor];
//    controller1.tabBarItem.title = @"新闻";

    viewController.tabBarItem.title = @"新闻";
//    viewController.tabBarItem.image = [UIImage imageNamed:@"/Users/shenfan/OCProjects/SimpleApp/SimpleApp/Image/left_disable.png"];
//    viewController.tabBarItem.selectedImage = [UIImage imageNamed:@"/Users/shenfan/OCProjects/SimpleApp/SimpleApp/Image/right_disable.png"];
    
    //想要改视频的Controller，则需要将这里的UIViewController替换为视频的Controller
    GTVideoViewController *videoController = [[GTVideoViewController alloc]init];
    //初始化可以放在GTVideoController中
    UIViewController *controller3 = [[UIViewController alloc]init];
    controller3.view.backgroundColor = [UIColor greenColor];
    controller3.tabBarItem.title = @"推荐";

    
    UIViewController *controller4 = [[UIViewController alloc]init];
    controller4.view.backgroundColor = [UIColor purpleColor];
    controller4.tabBarItem.title = @"我的";

    
     tabbarController.viewControllers = @[viewController,videoController,controller3,controller4];
    
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

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
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
