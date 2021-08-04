//
//  XiaoXiSheZhiViewController.m
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import "XiaoXiSheZhiViewController.h"

@interface XiaoXiSheZhiViewController ()

@end

@implementation XiaoXiSheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息设置";
    self.navigationController.navigationBar.translucent = NO;
    _array = [NSMutableArray arrayWithObjects:@"接受所有新消息通知", @"通知显示栏", @"声音", @"振动", @"关注更新", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -35, 390, 844) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
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
    [cell.textLabel setText:_array[indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 30, 30);
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_button_pressed.png"] forState:UIControlStateSelected];
    button.selected = NO;
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = button;
    return cell;
}

- (void)pressButton:(UIButton *)button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}

@end
