//
//  ViewControllerSetting.m
//  Zara仿写
//
//  Created by 浪极 on 2021/7/20.
//

#import "ViewControllerSetting.h"

@interface ViewControllerSetting ()

@end

@implementation ViewControllerSetting

//设置底部导航栏图标
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"shezhi.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置单元格
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //自动调整子视图的大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //数据视图头部、尾部视图的设定
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    [self.view addSubview:_tableView];
    
    //数据源处理
    NSMutableArray *dataArray0 = [NSMutableArray arrayWithObjects:@"我的", nil];
    NSMutableArray *dataArray1 = [NSMutableArray arrayWithObjects:@"支付", nil];
    NSMutableArray *dataArray2 = [NSMutableArray arrayWithObjects:@"朋友圈", @"卡包", @"表情", nil];
    _arrayData = [[NSMutableArray alloc] initWithObjects:dataArray0, dataArray1, dataArray2, nil];

    //图片源处理
    NSMutableArray *imageArray0 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"touxiang.jpeg"], nil];
    NSMutableArray *imageArray1 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"zhifu.png"], nil];
    NSMutableArray *imageArray2 = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"pengyouquan.png"], [UIImage imageNamed:@"qiabao.png"], [UIImage imageNamed:@"xiaolian.png"], nil];
    _imageData = [[NSMutableArray alloc] initWithObjects:imageArray0, imageArray1, imageArray2, nil];
    
    //数据源发生变化时，更新数据视图，重新加载数据
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *strID = @"shezhi";
    //尝试获取可复用的单元格
    //如果得不到，返回为nil
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    
    //设置单元格文字
    cell.textLabel.text = [[_arrayData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if(indexPath.section == 0) {
        cell.textLabel.font = [UIFont systemFontOfSize:30];
    }
    
    //设置单元格图片
    NSLog(@"%ld %ld",indexPath.section, indexPath.row);
    cell.imageView.image = [[_imageData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    //设置子标题
    if(indexPath.section == 0) {
        cell.detailTextLabel.text = @"微信号：111";
    }
    
    return cell;
}

//单元格组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

//每组单元格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 2) {
        return 3;
    }else {
        return 1;
    }
}

//单元格宽度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 120;
    }else {
        return 60;
    }
}

@end
