//
//  SearchViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import "SearchViewController.h"
#import "SubSearchViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sub.jpg"]];
    _findTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 324, 50)];
    _findTextField.placeholder = @"要查找的学生姓名";
    _findTextField.borderStyle = UITextBorderStyleRoundedRect;
    _findTextField.backgroundColor = [UIColor whiteColor];
    _findTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_findTextField];

    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _confirmButton.frame = CGRectMake(135, 450, 100, 40);
    [_confirmButton setImage:[UIImage imageNamed:@"queren.png"] forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(23, 43, 30, 28);
    [_backButton setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)search {
    int i = 0;
    for(i = 0; i < _nameArray.count; i++) {
        if([_findTextField.text isEqualToString:_nameArray[i]]) {
            break;
        }
    }
    if(i == _nameArray.count) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
       SubSearchViewController *subSearch = [[SubSearchViewController alloc] init];
        subSearch.modalPresentationStyle = UIModalPresentationFullScreen;
        subSearch.nameArray= _nameArray[i];
        subSearch.classArray = _classArray[i];
        subSearch.gradeArray = _gradeArray[i];
        [self presentViewController:subSearch animated:YES completion:nil];
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
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 100);}];
}

@end
