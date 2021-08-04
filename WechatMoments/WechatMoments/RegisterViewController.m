//
//  RegisterViewController.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"register.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 440, 300, 60)];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 30;
    registerButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(40, 280, 300, 60)];
    _userName.placeholder = @" 请输入用户名";
    _userName.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    _userName.font = [UIFont systemFontOfSize:23];
//    _userName.layer.masksToBounds = YES;
//    _userName.layer.cornerRadius = 30;
    [self.view addSubview:_userName];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(40, 360, 300, 60)];
    _password.placeholder = @" 请输入密码";
    _password.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    _password.font = [UIFont systemFontOfSize:23];
    _password.secureTextEntry = YES;
//    _password.layer.masksToBounds = YES;
//    _password.layer.cornerRadius = 30;
    [self.view addSubview:_password];
    
    _backButton = [[UIButton alloc] init];
    _backButton.frame = CGRectMake(10, 50, 30, 30);
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressRegisterButton {
    if ([_userName.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码不能为空！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];

    } else {
        LoginViewController *loginViewController = (LoginViewController *)self.presentingViewController;
        loginViewController.userName = _userName.text;
        loginViewController.password = _password.text;
        loginViewController.userNameTextField.text = _userName.text;
        loginViewController.passwordTextField.text = _password.text;
        loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)back {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
