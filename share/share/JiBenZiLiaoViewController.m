//
//  JiBenZiLiaoViewController.m
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import "JiBenZiLiaoViewController.h"

@interface JiBenZiLiaoViewController ()

@end

@implementation JiBenZiLiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本资料";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"jibenziliao.jpg"]];
    imageView.frame = CGRectMake(0, 0, 390, 322);
    [self.view addSubview:imageView];
    
    _buttonOne = [[UIButton alloc] init];
    _buttonOne.frame = CGRectMake(100, 220, 30, 30);
    [_buttonOne setImage:[UIImage imageNamed:@"sex_normal.png"] forState:UIControlStateNormal];
    [_buttonOne setImage:[UIImage imageNamed:@"sex_selected.png"] forState:UIControlStateSelected];
    _buttonOne.selected = YES;
    [_buttonOne addTarget:self action:@selector(pressOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonOne];
    
    _buttonTwo = [[UIButton alloc] init];
    _buttonTwo.frame = CGRectMake(170, 220, 30, 30);
    [_buttonTwo setImage:[UIImage imageNamed:@"sex_normal.png"] forState:UIControlStateNormal];
    [_buttonTwo setImage:[UIImage imageNamed:@"sex_selected.png"] forState:UIControlStateHighlighted];
    [_buttonTwo setImage:[UIImage imageNamed:@"sex_selected.png"] forState:UIControlStateSelected];
    _buttonTwo.selected = NO;
    [_buttonTwo addTarget:self action:@selector(pressTwo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonTwo];
}

- (void)pressOne {
    if (_buttonOne.selected == NO) {
        _buttonOne.selected = YES;
        _buttonTwo.selected = NO;
    }
}

- (void)pressTwo {
    if (_buttonTwo.selected == NO) {
        _buttonOne.selected = NO;
        _buttonTwo.selected = YES;
    }
}


@end
