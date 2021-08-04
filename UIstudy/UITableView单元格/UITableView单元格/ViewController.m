//
//  ViewController.m
//  UITableView单元格
//
//  Created by 浪极 on 2021/7/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //自动调整子视图的大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //数据视图头部、尾部视图的设定
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    [self.view addSubview:_tableView];
    
    _arrayData = [NSMutableArray new];
    for (int i = 1; i <= 20; i++) {
        NSString *str = [NSString stringWithFormat:@"A %d", i];
        [_arrayData addObject:str];
    }
    
    //数据源发生变化时，更新数据视图，重新加载数据
    [_tableView reloadData];
    
    [self createBtn];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}

//默认组数返回1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *strID = @"ID";
    
    //尝试获取可复用的单元格
    //如果得不到，返回为nil
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strID];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    //设置单元格文字
    cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];
    //设置子标题
    cell.detailTextLabel.text = @"子标题";
    
    NSString *str = [NSString stringWithFormat:@"%d.jpeg", indexPath.row % 7 + 1];
    
    UIImage *image = [UIImage imageNamed:str];
    
    //设置默认的图标信息
    cell.imageView.image = image;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


- (void)createBtn {
    _isEdit = NO;
    _btnEdit = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnFinish = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    _btnDelete = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    
    self.navigationItem.rightBarButtonItem = _btnEdit;
}

//当手指在单元格上移动时，显示编辑状态
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_arrayData removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    NSLog(@"delete");
}

//选中单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中单元格 %d %d", indexPath.section, indexPath.row);
}

//取消选中单元格
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中单元格 %d %d", indexPath.section, indexPath.row);
}

//单元格显示效果协议
- (UITableViewCellStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //UITableViewCellEditingStyleDelete 删除
    //UITableViewCellEditingStyleInsert 添加
    //UITableViewCellEditingStyleNone   什么都没有
    //UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert 多选
    return UITableViewCellEditingStyleDelete;
}

- (void)pressEdit {
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _btnFinish;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem = _btnDelete;
}

- (void)pressFinish {
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _btnEdit;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)pressDelete {
    
}



@end
