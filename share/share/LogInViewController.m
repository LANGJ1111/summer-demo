//
//  LogInViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "LogInViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ArticleViewController.h"
#import "ActivityViewController.h"
#import "MineViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"login_imageView.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *logInButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 510, 110, 53)];
    [logInButton setImage:[UIImage imageNamed:@"login_button.png"] forState:UIControlStateNormal];
    logInButton.layer.masksToBounds = YES;
    logInButton.layer.cornerRadius = 10;
    [logInButton addTarget:self action:@selector(pressLogIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logInButton];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 510, 110, 53)];
    [registerButton setImage:[UIImage imageNamed:@"register_button.png"] forState:UIControlStateNormal];
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 10;
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _autoLogInButton = [[UIButton alloc] initWithFrame:CGRectMake(42, 577, 15, 18)];
    [_autoLogInButton setImage:[UIImage imageNamed:@"autologin_normal.png"] forState:UIControlStateNormal];
    [_autoLogInButton setImage:[UIImage imageNamed:@"autologin_selected.png"] forState:UIControlStateSelected];
    [_autoLogInButton addTarget:self action:@selector(pressAutoLogIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_autoLogInButton];
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 347, 250, 60)];
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_userNameTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 423, 250, 50)];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.font = [UIFont systemFontOfSize:23];
    _passwordTextField.secureTextEntry = YES;
    [self.view addSubview:_passwordTextField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressLogIn {
//    if ([_userNameTextField.text isEqualToString:@""] || [_passwordTextField.text isEqualToString:@""]) {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码不能为空！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
//            [alert addAction:action];
//            [self presentViewController:alert animated:YES completion:nil];
//
//    } else if (!([_userNameTextField.text isEqualToString:_userName] && [_passwordTextField.text isEqualToString:_password])) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码错误！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
//        [alert addAction:action];
//        [self presentViewController:alert animated:YES completion:nil];
//
//
//    }else
    {
        UIWindow *window = [UIApplication sharedApplication].windows[0];
        HomeViewController *homeViewController = [[HomeViewController alloc] init];
        SearchViewController *searchViewController = [[SearchViewController alloc] init];
        ArticleViewController *articleViewController = [[ArticleViewController alloc] init];
        ActivityViewController *activityViewController = [[ActivityViewController alloc] init];
        MineViewController *mineViewController = [[MineViewController alloc] init];
        homeViewController.title = @"主页";
        searchViewController.title = @"搜索";
        articleViewController.title = @"文章";
        activityViewController.title = @"活动";
        mineViewController.title = @"我的";

        UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        UINavigationController *articleNavigationController = [[UINavigationController alloc] initWithRootViewController:articleViewController];
        UINavigationController *activityNavigationController = [[UINavigationController alloc] initWithRootViewController:activityViewController];
        UINavigationController *mineNavigationController = [[UINavigationController alloc] initWithRootViewController:mineViewController];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        NSArray *arrayNavigationControllers = [NSArray arrayWithObjects:homeNavigationController, searchNavigationController, articleNavigationController, activityNavigationController,  mineNavigationController, nil];
        tabBarController.viewControllers = arrayNavigationControllers;
        tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.3 green:0.6 blue:1 alpha:1];
        
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
        window.rootViewController = tabBarController;
    }
}

- (void)pressRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    [self presentViewController:registerViewController animated:NO completion:nil];
}

- (void)pressAutoLogIn {
    if (_autoLogInButton.selected == YES) {
        _autoLogInButton.selected = NO;
    } else {
        _autoLogInButton.selected = YES;
    }
}

@end


