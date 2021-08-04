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
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(125, 602, 140, 47)];
    [registerButton setImage:[UIImage imageNamed:@"registerConfirm_button.png"] forState:UIControlStateNormal];
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 8;
    [registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(90, 403, 250, 60)];
    _userName.placeholder = @"请输入用户名";
    _userName.font = [UIFont systemFontOfSize:23];
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:_userName];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(90, 486, 250, 50)];
    _password.placeholder = @"请输入密码";
    _password.font = [UIFont systemFontOfSize:23];
    _password.secureTextEntry = YES;
    [self.view addSubview:_password];
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

@end
