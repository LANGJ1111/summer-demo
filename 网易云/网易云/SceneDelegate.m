//
//  SceneDelegate.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "SceneDelegate.h"
#import "FindingViewController.h"
#import "CommunityViewController.h"
#import "MineViewController.h"
#import "SingingViewController.h"
#import "SettingViewController.h"


@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    //设置window
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    [self.window makeKeyAndVisible];
    
    
    //设置home和setting视图
    FindingViewController *findingViewController = [[FindingViewController alloc] init];
    CommunityViewController *communityViewController = [[CommunityViewController alloc] init];
    MineViewController *mineViewController = [[MineViewController alloc] init];
    SingingViewController *singingViewController = [[SingingViewController alloc] init];
    SettingViewController *settingViewController = [[SettingViewController alloc] init];
    findingViewController.title = @"发现";
    communityViewController.title = @"云村";
    mineViewController.title = @"我的";
    singingViewController.title = @"K歌";
    settingViewController.title = @"设置";

    UINavigationController *findingNavigationController = [[UINavigationController alloc] initWithRootViewController:findingViewController];
    UINavigationController *communityNavigationController = [[UINavigationController alloc] initWithRootViewController:communityViewController];
    UINavigationController *mineNavigationController = [[UINavigationController alloc] initWithRootViewController:mineViewController];
    UINavigationController *singingNavigationController = [[UINavigationController alloc] initWithRootViewController:singingViewController];
    UINavigationController *settingNavigationController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
    
    //设置分栏控制器
    UITabBarController *controllerTabBar = [[UITabBarController alloc] init];
    NSMutableArray *arrayNavigationControllers = [NSMutableArray arrayWithObjects:findingNavigationController, communityNavigationController, mineNavigationController, singingNavigationController,  settingNavigationController, nil];
    controllerTabBar.viewControllers = arrayNavigationControllers;
    controllerTabBar.tabBar.tintColor = [UIColor redColor];
    //将分栏控制器做为根视图控制器
    self.window.rootViewController = controllerTabBar;
    //通过索引确定显示哪一个控制器
    controllerTabBar.selectedIndex = 2;
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
