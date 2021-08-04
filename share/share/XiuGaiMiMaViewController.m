//
//  XiuGaiMiMaViewController.m
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import "XiuGaiMiMaViewController.h"

@interface XiuGaiMiMaViewController ()

@end

@implementation XiuGaiMiMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labelOne = [[UILabel alloc] init];
    _labelOne.frame = CGRectMake(20, 20, 100, 40);
    _labelOne.text = @"旧密码";
    _labelOne.backgroundColor = [UIColor clearColor];
    _labelOne.font = [UIFont systemFontOfSize:20];
    _labelOne.textColor = [UIColor blackColor];
    _labelOne.textAlignment = NSTextAlignmentCenter;
    _labelOne.numberOfLines = 1;
    [self.view addSubview:_labelOne];
    _labelTwo = [[UILabel alloc] init];
    _labelTwo.frame = CGRectMake(20, 70, 100, 40);
    _labelTwo.text = @"新密码";
    _labelTwo.backgroundColor = [UIColor clearColor];
    _labelTwo.font = [UIFont systemFontOfSize:20];
    _labelTwo.textColor = [UIColor blackColor];
    _labelTwo.textAlignment = NSTextAlignmentCenter;
    _labelTwo.numberOfLines = 1;
    [self.view addSubview:_labelTwo];
    _labelThree = [[UILabel alloc] init];
    _labelThree.frame = CGRectMake(20, 120, 100, 40);
    _labelThree.text = @"确认密码";
    _labelThree.backgroundColor = [UIColor clearColor];
    _labelThree.font = [UIFont systemFontOfSize:20];
    _labelThree.textColor = [UIColor blackColor];
    _labelThree.textAlignment = NSTextAlignmentCenter;
    _labelThree.numberOfLines = 1;
    [self.view addSubview:_labelThree];

    _textFieldOne = [[UITextField alloc] init];
    _textFieldOne.frame = CGRectMake(120, 20, 240, 40);
    _textFieldOne.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldOne.placeholder = @"6-20英文或数字组合";
    _textFieldOne.secureTextEntry = YES;
    [self.view addSubview:_textFieldOne];
    
    _textFieldTwo = [[UITextField alloc] init];
    _textFieldTwo.frame = CGRectMake(120, 70, 240, 40);
    _textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldTwo.placeholder = @"6-20英文或数字组合";
    _textFieldTwo.secureTextEntry = YES;
    [self.view addSubview:_textFieldTwo];
    
    _textFieldThree = [[UITextField alloc] init];
    _textFieldThree.frame = CGRectMake(120, 120, 240, 40);
    _textFieldThree.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldThree.placeholder = @"请再次确认输入密码";
    _textFieldThree.secureTextEntry = YES;
    [self.view addSubview:_textFieldThree];
    
    _button = [[UIButton alloc] init];
    _button.frame = CGRectMake(155, 200, 80, 30);
    _button.backgroundColor = [UIColor blackColor];
    //按钮文字
    [_button setTitle:@"提交" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.titleLabel.textAlignment = NSTextAlignmentCenter;
    _button.titleLabel.font = [UIFont systemFontOfSize:20];
    _button.layer.masksToBounds = YES;
    _button.layer.cornerRadius = 5;
    [_button addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)pressButton {
    if ([_textFieldTwo.text isEqualToString:_textFieldThree.text]) {
        _alert = [UIAlertController alertControllerWithTitle:@"修改成功！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:_alert animated:YES completion:nil];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pop) userInfo:nil repeats:NO];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"两次密码不一致！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)pop {
    [_alert dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end




