//
//  ViewController.m
//  UISwitch
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mySwitch = _mySwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mySwitch = [UISwitch new];
    _mySwitch.frame = CGRectMake(100, 200, 80, 40); //宽高已预设，修改无效！
    _mySwitch.on = YES;
    [_mySwitch setOn:YES animated:YES];
    
    //_mySwitch.backgroundColor = [UIColor orangeColor];
    //开启状态颜色
    [_mySwitch setOnTintColor:[UIColor redColor]];
    //开关按钮颜色
    [_mySwitch setThumbTintColor:[UIColor blueColor]];
    //整体风格颜色
    [_mySwitch setTintColor:[UIColor yellowColor]];
    //p1:函数实现对象
    //p2:函数对象
    //p3:事件响应时事件类型 UIControlEventValueChanged:状态发生变化时触发函数
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_mySwitch];
}

- (void)swChange:(UISwitch *)sw {
    if(sw.on == YES) {
        NSLog(@"开关被打开！");
    }else {
        NSLog(@"开关被关闭！");
    }
    NSLog(@"开关状态变化！");
}

@end
