//
//  StartViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "StartViewController.h"
#import "LogInViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [imageView setImage:[UIImage imageNamed:@"start_imageView.jpg"]];
    [self.view addSubview:imageView];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(log_in) userInfo:nil repeats:NO];
}

- (void)log_in {
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    LogInViewController *logInViewController = [[LogInViewController alloc] init];
    window.rootViewController = logInViewController;
}

@end
