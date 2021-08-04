//
//  MainViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"main.jpg"];
    [self.view addSubview:imageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, 500) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

@end
