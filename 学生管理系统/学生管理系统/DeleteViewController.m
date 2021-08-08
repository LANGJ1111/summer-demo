//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sub.jpg"]];
    _deleteTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 324, 50)];
    _deleteTextField.placeholder = @"要删除的学生姓名";
    _deleteTextField.borderStyle = UITextBorderStyleRoundedRect;
    _deleteTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_deleteTextField];
    
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _confirmButton.frame = CGRectMake(135, 450, 100, 40);
    [_confirmButton setImage:[UIImage imageNamed:@"queren.png"] forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(23, 43, 30, 28);
    [_backButton setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
          
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)delete {
    int i = 0;
    for(i = 0; i < _nameArray.count; i++) {
        if([_deleteTextField.text isEqualToString:_nameArray[i]]) {
            break;
        }
    }
    if(i == _nameArray.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    } else {
        [_nameArray removeObjectAtIndex:i];
        [_classArray removeObjectAtIndex:i];
        [_gradeArray removeObjectAtIndex:i];
        [self.delegate deleteReloadWithNameArray:_nameArray classArray:_classArray andGradeArray:_gradeArray];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除成功！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 100);}];
}

@end
