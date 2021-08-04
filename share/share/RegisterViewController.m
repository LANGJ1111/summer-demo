//
//  RegisterViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "RegisterViewController.h"
#import "LogInViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"register_imageView.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 602, 140, 47)];
    [registerButton setImage:[UIImage imageNamed:@"registerConfirm_button.png"] forState:UIControlStateNormal];
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 8;
    [registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _email = [[UITextField alloc] initWithFrame:CGRectMake(90, 333, 250, 50)];
    _email.placeholder = @"请输入邮箱";
    _email.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_email];
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(90, 403, 250, 60)];
    _userName.placeholder = @"请输入用户名";
    _userName.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_userName];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(90, 486, 250, 50)];
    _password.placeholder = @"请输入密码";
    _password.font = [UIFont systemFontOfSize:23];
    _password.secureTextEntry = YES;
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
        LogInViewController *logInViewController = (LogInViewController *)self.presentingViewController;
        logInViewController.userName = _userName.text;
        logInViewController.password = _password.text;
        logInViewController.userNameTextField.text = _userName.text;
        logInViewController.passwordTextField.text = _password.text;
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)back {
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}

@end
