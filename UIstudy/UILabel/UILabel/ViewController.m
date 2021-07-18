//
//  ViewController.m
//  UILabel
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)createUI {
    UILabel *label = [UILabel new];
    label.text = @"This is UILabel";
    label.frame = CGRectMake(100, 100, 160, 160);
    label.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:30];
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(5, 5);
    label.textAlignment = NSTextAlignmentCenter;    //Left,Center,Right
    label.numberOfLines = 0;    //默认1，为0时自动计算所需行数
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}


@end
