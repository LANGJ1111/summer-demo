//
//  ViewController.m
//  UITextField
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField = _textField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField = [UITextField new];
    self.textField.frame = CGRectMake(100, 100, 180, 40);
    self.textField.text = @"用户名";
    self.textField.font = [UIFont systemFontOfSize:15];
    self.textField.textColor = [UIColor blackColor];
    //UITextBorderStyleRoundedRect  圆角
    //UITextBorderStyleLine         线框
    //UITextBorderStyleBezel        bezel
    //UITextBorderStyleNone         无边框
    self.textField.borderStyle = UITextBorderStyleNone;
    //UIKeyboardTypeDefault         默认
    //UIKeyboardTypeNamePhonePad    字母+数字
    //UIKeyboardTypeNumberPad       数字
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.placeholder = @"请输入用户名......";
    //是否密码输入
    self.textField.secureTextEntry = YES;
    [self.view addSubview:_textField];
    self.textField.delegate = self;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.textField.text = @"";
    NSLog(@"开始编辑");
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"编辑结束");
}
//是否可以进行输入
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return  YES;
}
//是否可以结束输入
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者（回收键盘）
    [self.textField resignFirstResponder];
}


@end
