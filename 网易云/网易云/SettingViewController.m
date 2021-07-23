//
//  SettingViewController.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "SettingViewController.h"
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
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.view.tintColor = [UIColor blackColor];
    
    _leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"saoma.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    
    self.navigationItem.leftBarButtonItem = _leftButton;
    
    _rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"xiaotouxiang.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(pressRight)];
    
    self.navigationItem.rightBarButtonItem = _rightButton;
    
    //设置单元格
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, 763) style:UITableViewStyleInsetGrouped];
    [self.view addSubview:self.tableView];
    
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    //注册cell
    [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [self.tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [self.tableView registerClass:[LastTableViewCell class] forCellReuseIdentifier:@"last"];
    
    //头部和尾部
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    _mySwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
    [_mySwitch setTintColor:[UIColor redColor]];
    [_mySwitch addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
    
    
    //文字源处理
    NSMutableArray *textArray2 = [NSMutableArray arrayWithObjects:@"创作者中心", nil];
    NSMutableArray *textArray3 = [NSMutableArray arrayWithObjects:@"演出", @"商城", @"口袋彩铃", @"在线听歌免流量", nil];
    NSMutableArray *textArray4 = [NSMutableArray arrayWithObjects:@"设置", @"夜间模式", @"定时关闭", @"音乐黑名单", @"鲸鱼音效", @"添加Siri捷径", @"音乐闹钟", @"青少年模式", nil];
    NSMutableArray *textArray5 = [NSMutableArray arrayWithObjects:@"我的订单", @"优惠券", @"分享网易云音乐", @"关于",  nil];
    _normalTextData = [[NSMutableArray alloc] initWithObjects:textArray2, textArray3, textArray4, textArray5, nil];

    //图片源处理
    NSMutableArray *imageArray2 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"chuangzuozhe.png"], nil];
    NSMutableArray *imageArray3 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"yanchu.png"], [UIImage imageNamed:@"shangcheng.png"], [UIImage imageNamed:@"cailing.png"], [UIImage imageNamed:@"mianliuliang.png"], nil];
    NSMutableArray *imageArray4 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"shezhi.png"], [UIImage imageNamed:@"yejian.png"], [UIImage imageNamed:@"dingshi.png"], [UIImage imageNamed:@"heimingdan.png"], [UIImage imageNamed:@"jingyu.png"], [UIImage imageNamed:@"siri.png"], [UIImage imageNamed:@"naozhong.png"], [UIImage imageNamed:@"qingshaonian.png"], nil];
    NSMutableArray *imageArray5 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"dingdan.png"], [UIImage imageNamed:@"youhuiquan.png"], [UIImage imageNamed:@"fenxiang.png"], [UIImage imageNamed:@"guanyu.png"], nil];
    _normalImageData = [[NSMutableArray alloc] initWithObjects:imageArray2, imageArray3, imageArray4, imageArray5, nil];


}

- (void)pressLeft {
    
}

- (void)pressRight {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
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
        return 8;
    } else if (section == 5) {
        return 4;
    } else if (section == 6) {
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
        return 60;
    } else if (indexPath.section == 3) {
        return 60;
    } else if (indexPath.section == 4) {
        return 60;
    } else if (indexPath.section == 5) {
        return 60;
    } else if (indexPath.section == 6) {
        return 60;
    }
    
    return 70;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"账号";
    } else if (section == 1) {
        return @"我的";
    } else if (section == 2) {
        return @"";
    } else if (section == 3) {
        return @"音乐服务";
    } else if (section == 4) {
        return @"小工具";
    } else if (section == 5) {
        return @"其他";
    } else if (section == 6) {
        return @"";
    }
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    } else if (section == 1) {
        return 50;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 50;
    } else if (section == 4) {
        return 50;
    } else if (section == 5) {
        return 50;
    } else if (section == 6) {
        return 1;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取复用cell
    UITableViewCell *normalCell = [_tableView dequeueReusableCellWithIdentifier:@"normal"];
    FirstTableViewCell *firstCell = [_tableView dequeueReusableCellWithIdentifier:@"first"];
    SecondTableViewCell *secondCell = [_tableView dequeueReusableCellWithIdentifier:@"second"];
    LastTableViewCell *lastCell = [_tableView dequeueReusableCellWithIdentifier:@"last"];
    
    if (normalCell == nil) {
        normalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"normal"];
    }
    if (indexPath.section == 0) {
        firstCell = [self.tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        firstCell.backgroundColor = [UIColor whiteColor];
        
        [firstCell.buttonOne setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
        firstCell.buttonOne.layer.masksToBounds = YES;
        firstCell.buttonOne.layer.cornerRadius = 40;
        
        [firstCell.buttonTwo setImage:[UIImage imageNamed:@"zhuanyunbei.jpg"] forState:UIControlStateNormal];
        firstCell.buttonTwo.layer.masksToBounds = YES;
        firstCell.buttonTwo.layer.cornerRadius = 10;
        
        firstCell.label.text = @"芝麻凛";
        firstCell.label.backgroundColor = [UIColor clearColor];
        firstCell.label.font = [UIFont systemFontOfSize:20];
        firstCell.label.textColor = [UIColor blackColor];
        firstCell.label.textAlignment = NSTextAlignmentLeft;
        firstCell.label.numberOfLines = 0;
        return firstCell;

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    } else if (indexPath.section == 1) {
        secondCell = [self.tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        
        [secondCell.buttonOne setImage:[UIImage imageNamed:@"wodexiaoxi.jpg"]  forState:UIControlStateNormal];
        secondCell.buttonOne.layer.masksToBounds = YES;
        secondCell.buttonOne.layer.cornerRadius = 10;
        [secondCell.buttonTwo setImage:[UIImage imageNamed:@"wodehaoyou.jpg"] forState:UIControlStateNormal];
        secondCell.buttonTwo.layer.masksToBounds = YES;
        secondCell.buttonTwo.layer.cornerRadius = 10;
        [secondCell.buttonThree setImage:[UIImage imageNamed:@"gerenzhuye.jpg"] forState:UIControlStateNormal];
        secondCell.buttonThree.layer.masksToBounds = YES;
        secondCell.buttonThree.layer.cornerRadius = 10;
        [secondCell.buttonFour setImage:[UIImage imageNamed:@"gexingzhuangban.jpg"] forState:UIControlStateNormal];
        secondCell.buttonFour.layer.masksToBounds = YES;
        secondCell.buttonFour.layer.cornerRadius = 10;
        return secondCell;
        
    } else if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5) {
        normalCell.accessoryView = nil;
        normalCell.detailTextLabel.text = nil;
        normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        normalCell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        normalCell.textLabel.text = _normalTextData[indexPath.section - 2][indexPath.row];
        normalCell.imageView.image = _normalImageData[indexPath.section - 2][indexPath.row];
        
        if (indexPath.section == 4 && indexPath.row == 1) {
            normalCell.accessoryView = _mySwitch;
        }
        if (indexPath.section == 4 && indexPath.row == 4) {
            normalCell.detailTextLabel.text = @"未开启";
        }
        if (indexPath.section == 4 && indexPath.row == 7) {
            normalCell.detailTextLabel.text = @"未开启";
        }
        
        return normalCell;
        
    } else if(indexPath.section == 6) {
        lastCell = [self.tableView dequeueReusableCellWithIdentifier:@"last" forIndexPath:indexPath];
        
        lastCell.label.text = @"退出登陆";
        lastCell.label.backgroundColor = [UIColor whiteColor];
        lastCell.label.font = [UIFont systemFontOfSize:20];
        lastCell.label.textColor = [UIColor redColor];
        lastCell.label.textAlignment = NSTextAlignmentCenter;
        return lastCell;
    }
    
    return normalCell;
}

@end
