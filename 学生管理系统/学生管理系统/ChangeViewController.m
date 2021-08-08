//
//  ChangeViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
      [super viewDidLoad];
       self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sub.jpg"]];
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 220, 324, 45)];
        _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 280, 324, 45)];
        _gradeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 340, 324, 45)];
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _classTextField.borderStyle = UITextBorderStyleRoundedRect;
        _gradeTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.placeholder = @"修改后学生姓名";
        _classTextField.placeholder = @"修改后班级";
        _gradeTextField.placeholder = @"修改后分数";
        [self.view addSubview:_nameTextField];
        [self.view addSubview:_classTextField];
        [self.view addSubview:_gradeTextField];
        
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.frame = CGRectMake(135, 450, 100, 40);
        [_confirmButton setImage:[UIImage imageNamed:@"queren.png"] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_confirmButton];
        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(23, 43, 30, 28);
        [_backButton setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backButton];
          
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
        
        
    }

- (void)confirm {
        if(_nameTextField.text.length == 0 || _classTextField.text.length == 0 || _gradeTextField.text.length == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入完整信息！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            int temp = 0;
            for(int i = 0; i < _nameArray.count; i++) {
                if([_nameArray[i] isEqualToString:_nameTextField.text] ) {
                    temp = 1;
                    break;
                }
            }
            if(temp == 1) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已存在该姓名的学生！" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            } else {
                _nameArray[_number] = [NSString stringWithString:_nameTextField.text];
                _classArray[_number] = [NSString stringWithString:_classTextField.text];
                _gradeArray[_number] = [NSString stringWithString:_gradeTextField.text];
                
                [self.changeDelegate changeReloadWithNameArray:_nameArray classArray:_classArray andGradeArray:_gradeArray];
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
- (void)back {
        [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        [self.view endEditing:YES];

}
- (void)keyboardWillDisAppear:(NSNotification *)notification{
        [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
        [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, - 40);}];
}

@end
