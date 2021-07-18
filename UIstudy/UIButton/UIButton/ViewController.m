//
//  ViewController.m
//  UIButton
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)fontButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 200, 80);
    [button setTitle:@"Normal" forState:UIControlStateNormal];
    [button setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [button setTintColor:[UIColor whiteColor]];
    button.backgroundColor = [UIColor grayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:button];
}

- (void)imageButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 300, 100, 100);
    UIImage *icon1 = [UIImage imageNamed:@"1.jpeg"];
    UIImage *icon2 = [UIImage imageNamed:@"2.jpeg"];
    [button setImage:icon1 forState:UIControlStateNormal];
    [button setImage:icon2 forState:UIControlStateHighlighted];
    [self.view addSubview:button];
}

- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 500, 200, 80);
    [button setTitle:@"NO.100 button" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [button addTarget:self action:@selector(insideTouch:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(outsideTouch:) forControlEvents:UIControlEventTouchUpOutside];
    [button addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    button.tag = 100;
    [self.view addSubview:button];
}

- (void)insideTouch:(UIButton *)button {
    NSLog(@"NO.%d TouchUpInside", (int)button.tag);
}

- (void)outsideTouch:(UIButton *)button {
    NSLog(@"NO.%d TouchUpOutside", (int)button.tag);
}

- (void)touchDown:(UIButton *)button {
    NSLog(@"NO.%d TouchDown", (int)button.tag);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fontButton];
    [self imageButton];
    [self createButton];
}

@end
