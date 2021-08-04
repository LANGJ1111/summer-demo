//
//  LoginViewController.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "LoginViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "RegisterViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"login.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *logInButton = [[UIButton alloc] initWithFrame:CGRectMake(17, 527, 350, 56)];
    logInButton.backgroundColor = [UIColor clearColor];
    logInButton.layer.masksToBounds = YES;
    logInButton.layer.cornerRadius = 20;
    [logInButton addTarget:self action:@selector(pressLogIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logInButton];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(195, 597, 65, 20)];
    registerButton.backgroundColor = [UIColor clearColor];
    [registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 365, 250, 60)];
    _userNameTextField.placeholder = @"请输入用户名";
    _userNameTextField.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_userNameTextField];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(90, 450, 250, 50)];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.font = [UIFont systemFontOfSize:23];
    _passwordTextField.secureTextEntry = YES;
    [self.view addSubview:_passwordTextField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressLogIn {
    if ([_userNameTextField.text isEqualToString:@""] || [_passwordTextField.text isEqualToString:@""]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码不能为空！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];

    } else if (!(([_userNameTextField.text isEqualToString:_userName] && [_passwordTextField.text isEqualToString:_password]) || ([_userNameTextField.text isEqualToString:@"iOSnb123"] && ([_passwordTextField.text isEqualToString:@"123456789"])))) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码错误！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
} else {
        UIWindow *window = [UIApplication sharedApplication].windows[0];
        ViewController1 *viewController1 = [[ViewController1 alloc] init];
        ViewController2 *viewController2 = [[ViewController2 alloc] init];
        ViewController3 *viewController3 = [[ViewController3 alloc] init];
        ViewController4 *viewController4 = [[ViewController4 alloc] init];
        ViewController5 *viewController5 = [[ViewController5 alloc] init];

        UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
        UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
        UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
        UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
        UINavigationController *navigationController5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        NSArray *arrayNavigationControllers = [NSArray arrayWithObjects:navigationController1, navigationController2, navigationController3, navigationController4,  navigationController5, nil];
        tabBarController.viewControllers = arrayNavigationControllers;
        tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.3 green:0.6 blue:1 alpha:1];
        
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
        window.rootViewController = tabBarController;
    }
}

- (void)pressRegister {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerViewController animated:YES completion:nil];
}

@end
