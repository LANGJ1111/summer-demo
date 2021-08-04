//
//  MineViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "MineViewController.h"
#import "ShangChuanViewController.h"
#import "XinXiViewController.h"
#import "TuiJianViewController.h"
#import "SheZhiViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"wode.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"MINE";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 390, 140);
    [imageView setImage:[UIImage imageNamed:@"xinxi.png"]];
    [self.view addSubview:imageView];
    
    _array = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, 390, 400) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    _cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (_cell == nil) {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    UIImageView *imageView =  [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 20, 20);
    [imageView setImage:[UIImage imageNamed:@"img3.png"]];
    _cell.accessoryView = imageView;
    _cell.textLabel.text = _array[indexPath.row];
    [_cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ShangChuanViewController *shangChuanViewController = [[ShangChuanViewController alloc] init];
        [self.navigationController pushViewController:shangChuanViewController animated:YES];
    } else if (indexPath.row == 1) {
        XinXiViewController *xinXiViewController = [[XinXiViewController alloc] init];
        [self.navigationController pushViewController:xinXiViewController animated:YES];
    } else if (indexPath.row == 2) {
        TuiJianViewController *tuiJianViewController = [[TuiJianViewController alloc] init];
        [self.navigationController pushViewController:tuiJianViewController animated:YES];
    } else if (indexPath.row == 3) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您目前没有通知！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (indexPath.row == 4) {
        SheZhiViewController *sheZhiViewController = [[SheZhiViewController alloc] init];
        [self.navigationController pushViewController:sheZhiViewController animated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"需求被驳回！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
