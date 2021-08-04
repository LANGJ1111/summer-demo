//
//  StartViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import "StartViewController.h"
#import "LoginViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 390, 844)];
    [imageView setImage:[UIImage imageNamed:@"start.jpg"]];
    [self.view addSubview:imageView];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(70, 635, 240, 62);
    button.backgroundColor = [UIColor clearColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 20;
    [button addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pressButton {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginViewController animated:YES completion:nil];
}

@end
