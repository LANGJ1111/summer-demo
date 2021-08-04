//
//  XinXiViewController.m
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import "XinXiViewController.h"
#import "XinGuanZhuViewController.h"

@interface XinXiViewController ()

@end

@implementation XinXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的信息";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    _textArray = [NSMutableArray arrayWithObjects:@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"
     ];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _textArray[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 20, 20, 20);
    [imageView setImage:[UIImage imageNamed:@"img3.png"]];
    cell.accessoryView = imageView;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"目前没有最新内容！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (indexPath.row == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"目前没有最新内容！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (indexPath.row == 2) {
        XinGuanZhuViewController *xinGuanZhuViewController = [[XinGuanZhuViewController alloc] init];
        [self.navigationController pushViewController:xinGuanZhuViewController animated:YES];
    } else if (indexPath.row == 3) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"目前没有最新内容！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"目前没有最新内容！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
