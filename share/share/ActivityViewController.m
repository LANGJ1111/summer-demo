//
//  ActivityViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"huodong.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"ACTIVITY";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 390, 650);
    [imageView setImage:[UIImage imageNamed:@"activity.png"]];
    [self.view addSubview:imageView];
}

@end
