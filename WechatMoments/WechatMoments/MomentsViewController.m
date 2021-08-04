//
//  MomentsViewController.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "MomentsViewController.h"
#import "HeadTableViewCell.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"

@interface MomentsViewController ()

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _barButtonItem = [[UIBarButtonItem alloc] init];
    [_barButtonItem setImage:[UIImage imageNamed:@"fanhui.png"]];
    self.navigationItem.leftBarButtonItem = _barButtonItem;
    
    _firstTextName = [NSMutableArray arrayWithObjects:@"差不多先生", @"西邮郭富城", @"太一", @"元哲", @"水晶叔叔", nil];
    _firstTextText = [NSMutableArray arrayWithObjects:@"19 Puzzles.", @"十九岁的我眼里满是对未来的期待。", @"平原上的摩西", @"老干妈炒米", @"酵素五常大米，非常好吃！", nil];
    _firstTextTime = [NSMutableArray arrayWithObjects:@"差不多19分钟前", @"1小时前", @"昨天", @"everyday", @"2年前", nil];
    _secondTextName = [NSMutableArray arrayWithObjects:@"元哲", @"太一", @"水晶叔叔", @"差不多先生", @"西邮郭富城", nil];
    _secondTextText = [NSMutableArray arrayWithObjects:@"大家精力用在 正式的 考研国赛上，考研是 漫漫长路，，静心 ，日行一卒", @"结束结束", @"爱奇艺免费会员，数量有限，1-5天，私聊我", @"你仔包单？", @"你相信世上有奥特曼吗🐧", nil];
    _secondTextTime = [NSMutableArray arrayWithObjects:@"27分钟前", @"2小时前", @"3天前", @"差不多1年前", @"平成8年", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[HeadTableViewCell class] forCellReuseIdentifier:@"head"];
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    [_tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 350;
    } else if (indexPath.row == 0) {
        return 310;
    } else {
        return 115;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HeadTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"head" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 0) {
        FirstTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        cell.name.text = _firstTextName[indexPath.section - 1];
        cell.text.text = _firstTextText[indexPath.section - 1];
        cell.time.text = _firstTextTime[indexPath.section - 1];
        [cell.head setImage:[UIImage imageNamed:[NSString stringWithFormat:@"firsthead%ld.jpg", (long)indexPath.section]] forState:UIControlStateNormal];
        [cell.image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"firstimage%ld.jpg", (long)indexPath.section]]];
        return cell;
    } else {
        SecondTableViewCell *cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"second"];
        cell.name.text = _secondTextName[indexPath.section - 1];
        cell.text.text = _secondTextText[indexPath.section - 1];
        cell.time.text = _secondTextTime[indexPath.section - 1];
        [cell.head setImage:[UIImage imageNamed:[NSString stringWithFormat:@"secondimage%ld.jpg", (long)indexPath.section]] forState:UIControlStateNormal];
        return cell;
    }
}

@end
