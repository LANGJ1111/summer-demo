//
//  SceneDelegate.m
//  Zara仿写
//
//  Created by 浪极 on 2021/7/20.
//

#import "SceneDelegate.h"
#import "ViewControllerSetting.h"
#import "ViewControllerHome.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    //设置window
    self.window = [[UIWindow alloc] initWithWindowScene:scene];
    [self.window makeKeyAndVisible];
    
    //设置home和setting视图
    ViewControllerHome *homewViewController = [[ViewControllerHome alloc] init];
    ViewControllerSetting * settingViewController= [[ViewControllerSetting alloc] init];
    homewViewController.title = @"主页";
    settingViewController.title = @"设置";
    homewViewController.view.backgroundColor = [UIColor whiteColor];
    settingViewController.view.backgroundColor = [UIColor whiteColor];
    
    //设置根视图控制器
    UITabBarController *controllerTabBar = [[UITabBarController alloc] init];
    NSArray *arrayViewController = [NSArray arrayWithObjects:homewViewController, settingViewController, nil];
    controllerTabBar.viewControllers = arrayViewController;
    //将分栏控制器做为根视图控制器
    self.window.rootViewController = controllerTabBar;
    //通过索引确定显示哪一个控制器
    controllerTabBar.selectedIndex = 0;
    //设置分栏控制器的工具栏的透明度
    controllerTabBar.tabBar.translucent = NO;
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
