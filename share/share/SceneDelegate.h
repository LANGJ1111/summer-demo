//
//  SceneDelegate.h
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import <UIKit/UIKit.h>
#import "StartViewController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;

@property (strong, nonatomic) UITabBarController *startTabBarController;
@property (strong, nonatomic) UITabBarController *mainTabBarController;

@end

