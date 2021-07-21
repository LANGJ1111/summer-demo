//
//  SettingViewController.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "SettingViewController.h"
#import "MineTableViewCell.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "LastTableViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"setting.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置单元格
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, 390, 800)];
    [self.view addSubview:self.tableView];
    
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    //注册cell
    [self.tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"Mine"];
    
    //头部和尾部
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    //文字源处理
    NSMutableArray *dataArray0 = [NSMutableArray arrayWithObjects:@"我的", nil];
    NSMutableArray *dataArray1 = [NSMutableArray arrayWithObjects:@"支付", nil];
    NSMutableArray *dataArray2 = [NSMutableArray arrayWithObjects:@"朋友圈", @"卡包", @"表情", nil];
    _normalTextData = [[NSMutableArray alloc] initWithObjects:dataArray0, dataArray1, dataArray2, nil];

    //图片源处理
    NSMutableArray *imageArray0 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"touxiang.jpeg"], nil];
    NSMutableArray *imageArray1 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"zhifu.png"], nil];
    NSMutableArray *imageArray2 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"pengyouquan.png"], [UIImage imageNamed:@"qiabao.png"], [UIImage imageNamed:@"xiaolian.png"], nil];
    _imageData = [[NSMutableArray alloc] initWithObjects:imageArray0, imageArray1, imageArray2, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 4;
    } else if (section == 4) {
        return 12;
    } else if (section == 5) {
        return 1;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else if (indexPath.section == 1) {
        return 100;
    } else if (indexPath.section == 2) {
        return 70;
    } else if (indexPath.section == 3) {
        return 70;
    } else if (indexPath.section == 4) {
        return 70;
    } else if (indexPath.section == 5) {
        return 100;
    }
    
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取复用cell
    UITableViewCell *normalCell = [self.tableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    FirstTableViewCell *firstCell = [self.tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
    SecondTableViewCell *secondCell = [self.tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
    LastTableViewCell *lastCell = [self.tableView dequeueReusableCellWithIdentifier:@"last" forIndexPath:indexPath];
    
    if(normalCell == nil) {
        normalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"normal"];
    }
    if(firstCell == nil) {
        firstCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"first"];
    }
    if(secondCell == nil) {
        secondCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"second"];
    }
    if(lastCell == nil) {
        lastCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"last"];
    }
    
    if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4) {
        
        //设置文字和图片
        normalCell.textLabel.text = [[_arrayData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        normalCell.imageView.image = [[_imageData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    } else {
        
    }
    
    return cell;
}

@end
