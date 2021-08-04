//
//  ShangChuanViewController.m
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import "ShangChuanViewController.h"

@interface ShangChuanViewController ()

@end

@implementation ShangChuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我上传的";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    _firstButton = [[UIButton alloc] init];
    _firstButton.frame = CGRectMake(0, 25, 130, 35);
    _firstButton.backgroundColor = [UIColor clearColor];
    [_firstButton.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [_firstButton setTitle:@"精选文章" forState:UIControlStateNormal];
    [_firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_firstButton addTarget:self action:@selector(pressFirstButton) forControlEvents:UIControlEventTouchUpInside];
    _firstButton.selected = YES;
    [self.view addSubview:_firstButton];
    
    _secondButton = [[UIButton alloc] init];
    _secondButton.frame = CGRectMake(130, 25, 130, 35);
    _secondButton.backgroundColor = [UIColor clearColor];
    [_secondButton.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [_secondButton setTitle:@"热门推荐" forState:UIControlStateNormal];
    [_secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_secondButton addTarget:self action:@selector(pressSecondButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_secondButton];
    
    _thirdButton = [[UIButton alloc] init];
    _thirdButton.frame = CGRectMake(260, 25, 130, 35);
    _thirdButton.backgroundColor = [UIColor clearColor];
    [_thirdButton.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [_thirdButton setTitle:@"全部文章" forState:UIControlStateNormal];
    [_thirdButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_thirdButton addTarget:self action:@selector(pressThirdButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_thirdButton];
    
    _zan_situation = malloc(sizeof(int) * 12);
    _zan = malloc(sizeof(int) * 12);
    _guanzhu = malloc(sizeof(int) * 12);
    _share = malloc(sizeof(int) * 12);
    for (int i = 0; i < 12; i++) {
        _zan_situation[i] = 0;
        _zan[i] = 0;
        _guanzhu[i] = 0;
        _share[i] = 0;
    }

    _firstText = [NSMutableArray arrayWithObjects:@"我美吗", @"窝瓜", @"OC之母", @"OC之父", @"小丑&美人", @"笑嘻了", @"晚安玛卡巴卡", @"🐔7⃣️🐱", @"SONY大法好", @"杀戮の天使", @"谁か居ませんか？", @"喵喵喵", nil];
    _secondText = [NSMutableArray arrayWithObjects:@"share小白", @"share小王", @"share小顶", @"share小乔", @"share小彪", @"share小凯", @"share小卷", @"share小复", @"share小房", @"share小郭", @"share小旭", @"share小柱", nil];
    _thirdText = [NSMutableArray arrayWithObjects:@"抽象艺术", @"平面设计-画册设计", @"iOS的前世今生", @"iOS的前世今生", @"摄影艺术", @"摸鱼是一门学问", @"如何避免迟到买🍉", @"拼凑の图", @"这里不知道写什么", @"这里也不知道写什么", @"别看了", @"哦金额90dfqkjno", nil];
    _fourthText = [NSMutableArray arrayWithObjects:@"2分钟前", @"8分钟前", @"17分钟前", @"26分钟前", @"31分钟前", @"52分钟前", @"59分钟前", @"2小时前", @"8小时前", @"1天前", @"4天前", @"2周前", nil];
    
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 65, 390, 670);
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.contentSize = CGSizeMake(390 * 3, 670);
    _mainScrollView.bounces = NO;
    _mainScrollView.showsHorizontalScrollIndicator = YES;
    _mainScrollView.showsVerticalScrollIndicator = YES;
    _mainScrollView.alwaysBounceVertical = NO;
    _mainScrollView.delegate = self;
    _mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(-600, 0, 600, 0);
    _mainScrollView.tag = 900;
    [self.view addSubview:_mainScrollView];
//    [_mainScrollView flashScrollIndicators];
    
    _firstTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, 390, 660) style:UITableViewStylePlain];
    _firstTableView.delegate = self;
    _firstTableView.dataSource = self;
    [_firstTableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    _firstTableView.tableHeaderView = nil;
    _firstTableView.tableFooterView = nil;
    _firstTableView.tag = 801;
    [_mainScrollView addSubview:_firstTableView];
    
    _secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(390, 5, 390, 660) style:UITableViewStylePlain];
    _secondTableView.delegate = self;
    _secondTableView.dataSource = self;
    [_secondTableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    _secondTableView.tableHeaderView = nil;
    _secondTableView.tableFooterView = nil;
    _secondTableView.tag = 802;
    [_mainScrollView addSubview:_secondTableView];
    
    _thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(390 * 2, 5, 390, 660) style:UITableViewStylePlain];
    _thirdTableView.delegate = self;
    _thirdTableView.dataSource = self;
    [_thirdTableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    _thirdTableView.tableHeaderView = nil;
    _thirdTableView.tableFooterView = nil;
    _thirdTableView.tag = 803;
    [_mainScrollView addSubview:_thirdTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 803) {
        return 12;
    } else {
        return 4;
    }
    
}

//每组单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int row;
    if (tableView.tag == 801) {
        _secondCell = [self.firstTableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        row = (int)indexPath.section;
    } else if (tableView.tag == 802) {
        _secondCell = [self.secondTableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        row = (int)indexPath.section + 4;
    } else {
        _secondCell = [self.thirdTableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        row = (int)indexPath.section;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"article%d.jpg", row + 1];
    UIImage *image = [UIImage imageNamed:imageName];
    _secondCell.leftImageView.image = image;
    _secondCell.leftImageView.frame = CGRectMake(0, 0, 201, 150);
    
    _secondCell.firstLabel.frame = CGRectMake(210, 10, 170, 50);
    _secondCell.firstLabel.text = _firstText[row];
    _secondCell.firstLabel.font = [UIFont systemFontOfSize:20];
    _secondCell.firstLabel.numberOfLines = 0;
    _secondCell.secondLabel.frame = CGRectMake(210, 60, 170, 15);
    _secondCell.secondLabel.text = _secondText[row];
    _secondCell.secondLabel.font = [UIFont systemFontOfSize:13];
    _secondCell.secondLabel.numberOfLines = 0;
    _secondCell.thirdLabel.frame = CGRectMake(210, 75, 170, 15);
    _secondCell.thirdLabel.text = _thirdText[row];
    _secondCell.thirdLabel.font = [UIFont systemFontOfSize:15];
    _secondCell.thirdLabel.numberOfLines = 0;
    _secondCell.fourthLabel.frame = CGRectMake(210, 95, 170, 15);
    _secondCell.fourthLabel.text = _fourthText[row];
    _secondCell.fourthLabel.font = [UIFont systemFontOfSize:13];
    _secondCell.fourthLabel.numberOfLines = 0;

    _secondCell.firstButton.frame = CGRectMake(205, 120, 60, 30);
    [_secondCell.firstButton setTitle:[NSString stringWithFormat:@"%d", _zan[row - 1]] forState:UIControlStateNormal];
    [_secondCell.firstButton setTitle:[NSString stringWithFormat:@"%d", _zan[row - 1] + 1] forState:UIControlStateSelected];
    if (_zan_situation[row - 1] == 1) {
        _secondCell.firstButton.selected = YES;
    } else {
        _secondCell.firstButton.selected = NO;
    }
    [_secondCell.firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_secondCell.firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateSelected];
    _secondCell.firstButton.backgroundColor = [UIColor clearColor];
    _secondCell.firstButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.firstButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.firstButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.firstButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.firstButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.firstButton.tag = row + 499;
    [_secondCell.firstButton addTarget:self action:@selector(pressFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    _secondCell.secondButton.frame = CGRectMake(265, 120, 60, 30);
    [_secondCell.secondButton setTitle:[NSString stringWithFormat:@"%d", _guanzhu[row - 1]] forState:UIControlStateNormal];
    [_secondCell.secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_secondCell.secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateSelected];
    _secondCell.secondButton.backgroundColor = [UIColor clearColor];
    _secondCell.secondButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.secondButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.secondButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.secondButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.secondButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.secondButton.tag = row + 599;
    [_secondCell.secondButton addTarget:self action:@selector(pressSecond:) forControlEvents:UIControlEventTouchUpInside];
    
    _secondCell.thirdButton.frame = CGRectMake(325, 120, 60, 30);
    [_secondCell.thirdButton setTitle:[NSString stringWithFormat:@"%d", _share[row - 1]] forState:UIControlStateNormal];
    [_secondCell.thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    [_secondCell.thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateSelected];
    _secondCell.thirdButton.backgroundColor = [UIColor clearColor];
    _secondCell.thirdButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondCell.thirdButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondCell.thirdButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondCell.thirdButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondCell.thirdButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    _secondCell.thirdButton.tag = row + 699;
    [_secondCell.thirdButton addTarget:self action:@selector(pressThird:) forControlEvents:UIControlEventTouchUpInside];
        
    return _secondCell;
}

- (void)save {
//    [_mainScrollView flashScrollIndicators];
}

- (void)pressFirstButton {
    if (_firstButton.selected == NO) {
        _firstButton.selected = YES;
        _secondButton.selected = NO;
        _thirdButton.selected = NO;
        [_mainScrollView scrollRectToVisible:CGRectMake(0, 0, 390, 615) animated:YES];
    }
}

- (void)pressSecondButton {
    if (_secondButton.selected == NO) {
        _firstButton.selected = NO;
        _secondButton.selected = YES;
        _thirdButton.selected = NO;
        [_mainScrollView scrollRectToVisible:CGRectMake(390, 0, 390, 615) animated:YES];
    }
}

- (void)pressThirdButton {
    if (_thirdButton.selected == NO) {
        _firstButton.selected = NO;
        _secondButton.selected = NO;
        _thirdButton.selected = YES;
        [_mainScrollView scrollRectToVisible:CGRectMake(390 * 2, 0, 390, 615) animated:YES];
    }
}

- (void)pressFirst:(UIButton *)button {
    if (button.selected == YES) {
        button.selected = NO;
        _zan_situation[button.tag - 500] = 0;
    } else {
        button.selected = YES;
        _zan_situation[button.tag - 500] = 1;
    }
    [_firstTableView reloadData];
    [_secondTableView reloadData];
    [_thirdTableView reloadData];
}

- (void)pressSecond:(UIButton *)button {
    _guanzhu[button.tag - 600]++;
    [button setTitle:[NSString stringWithFormat:@"%d", _guanzhu[button.tag - 600]] forState:UIControlStateNormal];
    [_firstTableView reloadData];
    [_secondTableView reloadData];
    [_thirdTableView reloadData];
}

- (void)pressThird:(UIButton *)button {
    _share[button.tag - 700]++;
    [button setTitle:[NSString stringWithFormat:@"%d", _share[button.tag - 700]] forState:UIControlStateNormal];
    [_firstTableView reloadData];
    [_secondTableView reloadData];
    [_thirdTableView reloadData];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_firstTableView reloadData];
    [_secondTableView reloadData];
    [_thirdTableView reloadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 900) {
        if(scrollView.contentOffset.x == 0) {
            [_firstButton setSelected:YES];
            [_secondButton setSelected:NO];
            [_thirdButton setSelected:NO];
        } else if (scrollView.contentOffset.x == 390) {
            [_firstButton setSelected:NO];
            [_secondButton setSelected:YES];
            [_thirdButton setSelected:NO];
        } else if (scrollView.contentOffset.x == 390 * 2) {
            [_firstButton setSelected:NO];
            [_secondButton setSelected:NO];
            [_thirdButton setSelected:YES];
        }
    }
}

@end
