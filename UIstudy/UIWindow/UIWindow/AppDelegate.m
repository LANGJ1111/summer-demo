//
//  AppDelegate.m
//  UIWindow
//
//  Created by 浪极 on 2021/7/18.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//初始化整个程序框架结构
//整个程序对iOS开发工程师的入口函数
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //整个程序只有一个UIWindow
    //UIWindow继承于UIView
    //UIScreen为屏幕硬件表示类
    //mainScreen获得主屏幕设备信息
    //bounds表示屏幕的宽高值
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //创建视图控制器
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor blueColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    view.backgroundColor = [UIColor orangeColor];
    UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 240, 360)];
    backview.backgroundColor = [UIColor greenColor];
    [backview addSubview:view];
    [self.window addSubview:backview];
    //使window有效并显示到屏幕上
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
