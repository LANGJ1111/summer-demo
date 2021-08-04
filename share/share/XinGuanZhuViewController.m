//
//  XinGuanZhuViewController.m
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import "XinGuanZhuViewController.h"

@interface XinGuanZhuViewController ()

@end

@implementation XinGuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"新关注的";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    _textArray = [NSMutableArray arrayWithObjects:@"太一", @"元哲", @"西邮郭富城", @"差不多先生", @"复杂化", nil];
    
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
    return 80;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _textArray[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 25, 74, 30);
    [button setImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"guanzhu_pressed.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = button;
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"head%ld.jpg", (long)indexPath.row]]];
    
    return cell;
}

- (void)pressButton:(UIButton *)button {
    NSLog(@"1");
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}

@end
