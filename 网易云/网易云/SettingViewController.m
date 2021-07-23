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
#import "SettingSubViewController.h"

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
    
    
    
    //导航栏设置
    self.navigationController.view.tintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 390, 1000)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [self.view bringSubviewToFront:view];
    
    
    _leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"saoma.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = _leftButton;
    
    _rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"xiaotouxiang.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = _rightButton;

    
    
    //tableView设置
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 390, 763) style:UITableViewStyleInsetGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [_tableView registerClass:[LastTableViewCell class] forCellReuseIdentifier:@"last"];
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    
    
    //switch设置
    _mySwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
    [_mySwitch setTintColor:[UIColor redColor]];
    [_mySwitch addTarget:self action:@selector(pressSwitch) forControlEvents:UIControlEventValueChanged];
    
    
    
    //文字源处理
    _textArrayTwo = [NSMutableArray arrayWithObjects:@"创作者中心", nil];
    _textArrayThree = [NSMutableArray arrayWithObjects:@"演出", @"商城", @"口袋彩铃", @"在线听歌免流量", nil];
    _textArrayFour = [NSMutableArray arrayWithObjects:@"设置", @"夜间模式", @"定时关闭", @"音乐黑名单", @"鲸鱼音效", @"添加Siri捷径", @"音乐闹钟", @"青少年模式", nil];
    _textArrayFive = [NSMutableArray arrayWithObjects:@"我的订单", @"优惠券", @"分享网易云音乐", @"关于",  nil];
    _normalTextData = [[NSMutableArray alloc] initWithObjects:_textArrayTwo, _textArrayThree, _textArrayFour, _textArrayFive, nil];

    //图片源处理
    _imageArrayTwo = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"chuangzuozhe.png"], nil];
    _imageArrayThree = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"yanchu.png"], [UIImage imageNamed:@"shangcheng.png"], [UIImage imageNamed:@"cailing.png"], [UIImage imageNamed:@"mianliuliang.png"], nil];
    _imageArrayFour = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"shezhi.png"], [UIImage imageNamed:@"yejian.png"], [UIImage imageNamed:@"dingshi.png"], [UIImage imageNamed:@"heimingdan.png"], [UIImage imageNamed:@"jingyu.png"], [UIImage imageNamed:@"siri.png"], [UIImage imageNamed:@"naozhong.png"], [UIImage imageNamed:@"qingshaonian.png"], nil];
    _imageArrayFive = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"dingdan.png"], [UIImage imageNamed:@"youhuiquan.png"], [UIImage imageNamed:@"fenxiang.png"], [UIImage imageNamed:@"guanyu.png"], nil];
    _normalImageData = [[NSMutableArray alloc] initWithObjects:_imageArrayTwo, _imageArrayThree, _imageArrayFour, _imageArrayFive, nil];
}



//导航栏左侧按钮
- (void)pressLeft {
    _settingSubViewController = [[SettingSubViewController alloc] init];
    [self.navigationController pushViewController:_settingSubViewController animated:YES];
}

//导航栏右侧按钮
- (void)pressRight {
    
}

//switch按钮
- (void)pressSwitch {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
}

//单 元 格 协 议

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

//每组单元格个数
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

//每组单元格宽度
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

//每组单元格头部
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

//每组单元格尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

//每组单元格尾部设置
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    _footerView = [[UIView alloc] init];
    _footerView.backgroundColor = [UIColor clearColor];
    return _footerView;
}

//单元格创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _normalCell = [_tableView dequeueReusableCellWithIdentifier:@"normal"];
    _firstCell = [_tableView dequeueReusableCellWithIdentifier:@"first"];
    _secondCell = [_tableView dequeueReusableCellWithIdentifier:@"second"];
    _lastCell = [_tableView dequeueReusableCellWithIdentifier:@"last"];
    
    if (_normalCell == nil) {
        _normalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"normal"];
    }
    
    if (indexPath.section == 0) {
        _firstCell = [self.tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        _firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        _firstCell.backgroundColor = [UIColor whiteColor];
        
        [_firstCell.buttonOne setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
        _firstCell.buttonOne.layer.masksToBounds = YES;
        _firstCell.buttonOne.layer.cornerRadius = 40;
        
        [_firstCell.buttonTwo setImage:[UIImage imageNamed:@"zhuanyunbei.jpg"] forState:UIControlStateNormal];
        _firstCell.buttonTwo.layer.masksToBounds = YES;
        _firstCell.buttonTwo.layer.cornerRadius = 10;
        
        _firstCell.label.text = @"芝麻凛";
        _firstCell.label.backgroundColor = [UIColor clearColor];
        _firstCell.label.font = [UIFont systemFontOfSize:20];
        _firstCell.label.textColor = [UIColor blackColor];
        _firstCell.label.textAlignment = NSTextAlignmentLeft;
        _firstCell.label.numberOfLines = 0;
        
        return _firstCell;
        
        
    } else if (indexPath.section == 1) {
        _secondCell = [self.tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        
        [_secondCell.buttonOne setImage:[UIImage imageNamed:@"wodexiaoxi.jpg"]  forState:UIControlStateNormal];
        _secondCell.buttonOne.layer.masksToBounds = YES;
        _secondCell.buttonOne.layer.cornerRadius = 10;
        
        [_secondCell.buttonTwo setImage:[UIImage imageNamed:@"wodehaoyou.jpg"] forState:UIControlStateNormal];
        _secondCell.buttonTwo.layer.masksToBounds = YES;
        _secondCell.buttonTwo.layer.cornerRadius = 10;
        
        [_secondCell.buttonThree setImage:[UIImage imageNamed:@"gerenzhuye.jpg"] forState:UIControlStateNormal];
        _secondCell.buttonThree.layer.masksToBounds = YES;
        _secondCell.buttonThree.layer.cornerRadius = 10;
        
        [_secondCell.buttonFour setImage:[UIImage imageNamed:@"gexingzhuangban.jpg"] forState:UIControlStateNormal];
        _secondCell.buttonFour.layer.masksToBounds = YES;
        _secondCell.buttonFour.layer.cornerRadius = 10;
        
        return _secondCell;
        
        
    } else if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5) {
        _normalCell.accessoryView = nil;
        _normalCell.detailTextLabel.text = nil;
        _normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _normalCell.selectionStyle = UITableViewCellSelectionStyleGray;
        _normalCell.textLabel.text = _normalTextData[indexPath.section - 2][indexPath.row];
        _normalCell.imageView.image = _normalImageData[indexPath.section - 2][indexPath.row];
        
        if (indexPath.section == 4 && indexPath.row == 1) {
            _normalCell.accessoryView = _mySwitch;
        }
        
        if (indexPath.section == 4 && indexPath.row == 4) {
            _normalCell.detailTextLabel.text = @"未开启";
        }
        
        if (indexPath.section == 4 && indexPath.row == 7) {
            _normalCell.detailTextLabel.text = @"未开启";
        }
        
        return _normalCell;
        
        
    } else if(indexPath.section == 6) {
        _lastCell = [self.tableView dequeueReusableCellWithIdentifier:@"last" forIndexPath:indexPath];
        
        _lastCell.label.text = @"退出登陆";
        _lastCell.label.backgroundColor = [UIColor whiteColor];
        _lastCell.label.font = [UIFont systemFontOfSize:20];
        _lastCell.label.textColor = [UIColor redColor];
        _lastCell.label.textAlignment = NSTextAlignmentCenter;
        
        return _lastCell;
    }
    
    return _normalCell;
}

@end
