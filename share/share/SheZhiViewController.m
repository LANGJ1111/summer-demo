//
//  SheZhiViewController.m
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import "SheZhiViewController.h"
#import "JiBenZiLiaoViewController.h"
#import "XiuGaiMiMaViewController.h"
#import "XiaoXiSheZhiViewController.h"

@interface SheZhiViewController ()

@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    _textArray = [NSMutableArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    
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
        JiBenZiLiaoViewController *jiBenZiLiaoViewController = [[JiBenZiLiaoViewController alloc] init];
        [self.navigationController pushViewController:jiBenZiLiaoViewController animated:YES];
    } else if (indexPath.row == 1) {
        XiuGaiMiMaViewController *xiuGaiMiMaViewController = [[XiuGaiMiMaViewController alloc] init];
        [self.navigationController pushViewController:xiuGaiMiMaViewController animated:YES];
    } else if (indexPath.row == 2) {
        XiaoXiSheZhiViewController *xiaoXiSheZhiViewController = [[XiaoXiSheZhiViewController alloc] init];
        [self.navigationController pushViewController:xiaoXiSheZhiViewController animated:YES];
    } else if (indexPath.row == 3) {
        _alert = [UIAlertController alertControllerWithTitle:@"目前没有新内容！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [_alert addAction:action];
        [self presentViewController:_alert animated:YES completion:nil];
    } else {
        _alert = [UIAlertController alertControllerWithTitle:@"缓存已清除" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:_alert animated:YES completion:nil];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(back) userInfo:nil repeats:NO];
    }
}

- (void)back {
    [_alert dismissViewControllerAnimated:YES completion:nil];
}

@end
