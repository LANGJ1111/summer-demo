//
//  TuiJianViewController.m
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import "TuiJianViewController.h"

@interface TuiJianViewController ()

@end

@implementation TuiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我推荐的";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    _zan = malloc(sizeof(int) * 4);
    _guanzhu = malloc(sizeof(int) * 4);
    _share = malloc(sizeof(int) * 4);
    _zan[0] = 102;
    _zan[1] = 128;
    _zan[2] = 553;
    _zan[3] = 698;
    _guanzhu[0] = 210;
    _guanzhu[1] = 355;
    _guanzhu[2] = 477;
    _guanzhu[3] = 791;
    _share[0] = 13;
    _share[1] = 28;
    _share[2] = 59;
    _share[3] = 99;

    _firstText = [NSMutableArray arrayWithObjects:@"假日", @"国外画册欣赏", @"collection扁平设计", @"板式整理术：高效解决多风格要求", nil];
    _secondText = [NSMutableArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小顶", nil];
    _thirdText = [NSMutableArray arrayWithObjects:@"原创-插画-练习习作", @"平面设计-画册设计", @"平面设计-海报设计", @"平面设计-样式设计", nil];
    _fourthText = [NSMutableArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"18分钟前", nil];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, 750) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    [self.view addSubview:_tableView];
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

//每组单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//每组单元格宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _secondCell = [self.tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"list_img%d.png", (int)indexPath.section + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    _secondCell.leftImageView.image = image;
    _secondCell.leftImageView.frame = CGRectMake(0, 0, 201, 150);
    
    _secondCell.firstLabel.frame = CGRectMake(210, 10, 170, 50);
    _secondCell.firstLabel.text = _firstText[(int)indexPath.section];
    _secondCell.firstLabel.font = [UIFont systemFontOfSize:20];
    _secondCell.firstLabel.numberOfLines = 0;
    _secondCell.secondLabel.frame = CGRectMake(210, 60, 170, 15);
    _secondCell.secondLabel.text = _secondText[(int)indexPath.section];
    _secondCell.secondLabel.font = [UIFont systemFontOfSize:13];
    _secondCell.secondLabel.numberOfLines = 0;
    _secondCell.thirdLabel.frame = CGRectMake(210, 75, 170, 15);
    _secondCell.thirdLabel.text = _thirdText[(int)indexPath.section];
    _secondCell.thirdLabel.font = [UIFont systemFontOfSize:15];
    _secondCell.thirdLabel.numberOfLines = 0;
    _secondCell.fourthLabel.frame = CGRectMake(210, 95, 170, 15);
    _secondCell.fourthLabel.text = _fourthText[(int)indexPath.section];
    _secondCell.fourthLabel.font = [UIFont systemFontOfSize:13];
    _secondCell.fourthLabel.numberOfLines = 0;

    _secondCell.firstButton.frame = CGRectMake(205, 120, 60, 30);
    [_secondCell.firstButton setTitle:[NSString stringWithFormat:@"%d", _zan[(int)indexPath.section]] forState:UIControlStateNormal];
    [_secondCell.firstButton setTitle:[NSString stringWithFormat:@"%d", _zan[(int)indexPath.section] + 1] forState:UIControlStateSelected];
    [_secondCell.firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_secondCell.firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateSelected];
    _secondCell.firstButton.backgroundColor = [UIColor clearColor];
    _secondCell.firstButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.firstButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.firstButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.firstButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.firstButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.firstButton.tag = indexPath.section + 500;
    [_secondCell.firstButton addTarget:self action:@selector(pressFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    _secondCell.secondButton.frame = CGRectMake(265, 120, 60, 30);
    [_secondCell.secondButton setTitle:[NSString stringWithFormat:@"%d", _guanzhu[(int)indexPath.section]] forState:UIControlStateNormal];
    [_secondCell.secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_secondCell.secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateSelected];
    _secondCell.secondButton.backgroundColor = [UIColor clearColor];
    _secondCell.secondButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.secondButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.secondButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.secondButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.secondButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.secondButton.tag = indexPath.section + 600;
    [_secondCell.secondButton addTarget:self action:@selector(pressSecond:) forControlEvents:UIControlEventTouchUpInside];
    
    _secondCell.thirdButton.frame = CGRectMake(325, 120, 60, 30);
    [_secondCell.thirdButton setTitle:[NSString stringWithFormat:@"%d", _share[(int)indexPath.section]] forState:UIControlStateNormal];
    [_secondCell.thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    [_secondCell.thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateSelected];
    _secondCell.thirdButton.backgroundColor = [UIColor clearColor];
    _secondCell.thirdButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.thirdButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.thirdButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.thirdButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.thirdButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.thirdButton.tag = indexPath.section + 700;
    [_secondCell.thirdButton addTarget:self action:@selector(pressThird:) forControlEvents:UIControlEventTouchUpInside];
    
    return _secondCell;
}

- (void)pressFirst:(UIButton *)button {
    if (button.selected) {
        button.selected = NO;
        _zan[button.tag - 500]--;
        [button setTitle:[NSString stringWithFormat:@"%d", _zan[button.tag - 500]] forState:UIControlStateNormal];
    } else {
        button.selected = YES;
        _zan[button.tag - 500]++;
        [button setTitle:[NSString stringWithFormat:@"%d", _zan[button.tag - 500]] forState:UIControlStateNormal];
    }
}

- (void)pressSecond:(UIButton *)button {
    _guanzhu[button.tag - 600]++;
    [button setTitle:[NSString stringWithFormat:@"%d", _guanzhu[button.tag - 600]] forState:UIControlStateNormal];
}

- (void)pressThird:(UIButton *)button {
    _share[button.tag - 700]++;
    [button setTitle:[NSString stringWithFormat:@"%d", _share[button.tag - 700]] forState:UIControlStateNormal];
}

@end
