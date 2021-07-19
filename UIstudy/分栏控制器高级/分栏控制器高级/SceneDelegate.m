//
//  SceneDelegate.m
//  分栏控制器高级
//
//  Created by 浪极 on 2021/7/19.
//

#import "SceneDelegate.h"
#import "VCOne.h"
#import "VCTwo.h"
#import "VCThree.h"
#import "VCFour.h"
#import "VCFive.h"
#import "VCSix.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:scene];
    [self.window makeKeyAndVisible];
    
    VCOne *vc1 = [VCOne new];
    VCTwo *vc2 = [VCTwo new];
    VCThree *vc3 = [VCThree new];
    VCFour *vc4 = [VCFour new];
    VCFive *vc5 = [VCFive new];
    VCSix *vc6 = [VCSix new];
    
    vc1.view.backgroundColor = [UIColor blueColor];
    vc2.view.backgroundColor = [UIColor yellowColor];
    vc3.view.backgroundColor = [UIColor purpleColor];
    vc4.view.backgroundColor = [UIColor grayColor];
    vc5.view.backgroundColor = [UIColor greenColor];
    vc6.view.backgroundColor = [UIColor orangeColor];

    vc1.title = @"视图1";
    vc2.title = @"视图2";
    vc3.title = @"视图3";
    vc4.title = @"视图4";
    vc5.title = @"视图5";
    vc6.title = @"视图6";

    NSArray *arrayVC = [NSArray arrayWithObjects:vc1, vc2, vc3, vc4, vc5, vc6, nil];
    UITabBarController *tbc = [UITabBarController new];
    tbc.viewControllers = arrayVC;
    tbc.tabBar.translucent = NO;
    self.window.rootViewController = tbc;
    tbc.tabBar.barTintColor = [UIColor greenColor];
    tbc.tabBar.tintColor = [UIColor blackColor];
    tbc.delegate = self;
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    NSLog(@"即将开始编辑");
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    NSLog(@"即将结束编辑");
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    NSLog(@"%@", viewControllers);
    if (changed == YES) {
        NSLog(@"顺序发生改变");
    }else {
        NSLog(@"顺序没有改变");
    }
    NSLog(@"已经结束编辑");
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.viewControllers[tabBarController.selectedIndex] == viewController) {
        NSLog(@"OK");
    }
    NSLog(@"选中控制器对象");
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
